@implementation ASDTIOA2LegacyControl

+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  uint64_t ControlInfo_Class;
  const __CFDictionary *v11;
  unsigned int ControlInfo_BaseClass;
  const __CFDictionary *v13;
  uint64_t ControlInfo_Scope;
  const __CFDictionary *v15;
  uint64_t ControlInfo_Element;
  const __CFDictionary *v17;
  _BOOL4 Only;
  __objc2_class **v19;
  __objc2_class **v20;
  ASDTIOA2LegacyBooleanControl *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  ASDTIOA2LegacyBooleanControl *v26;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("control ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  ControlInfo_Class = ASDT::IOA2UCDevice::GetControlInfo_Class((ASDT::IOA2UCDevice *)v5, v9);
  ControlInfo_BaseClass = ASDT::IOA2UCDevice::GetControlInfo_BaseClass((ASDT::IOA2UCDevice *)v5, v11);
  ControlInfo_Scope = ASDT::IOA2UCDevice::GetControlInfo_Scope((ASDT::IOA2UCDevice *)v5, v13);
  ControlInfo_Element = ASDT::IOA2UCDevice::GetControlInfo_Element((ASDT::IOA2UCDevice *)v5, v15);
  Only = ASDT::IOA2UCDevice::GetControlInfo_IsReadOnly((ASDT::IOA2UCDevice *)v5, v17);
  switch(ControlInfo_BaseClass)
  {
    case 0x6C65766Cu:
      v20 = off_25084AAE0;
LABEL_9:
      v21 = (ASDTIOA2LegacyBooleanControl *)objc_msgSend(objc_alloc(*v20), "initWithIOA2Device:userClientID:isSettable:forElement:inScope:objectClassID:dictionary:", v6, v8, !Only, ControlInfo_Element, ControlInfo_Scope, ControlInfo_Class, v5);
      goto LABEL_25;
    case 0x736C6374u:
      v20 = off_25084AAF0;
      goto LABEL_9;
    case 0x746F676Cu:
      if ((_DWORD)ControlInfo_Class == 1836414053)
      {
        v19 = off_25084AAE8;
      }
      else
      {
        if ((_DWORD)ControlInfo_Class != 1784767339)
        {
          v21 = -[ASDTIOA2LegacyBooleanControl initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:]([ASDTIOA2LegacyBooleanControl alloc], "initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:", v6, v8, !Only, ControlInfo_Element, ControlInfo_Scope, ControlInfo_Class, v5);
          goto LABEL_25;
        }
        v19 = off_25084AAD8;
      }
      v21 = (ASDTIOA2LegacyBooleanControl *)objc_msgSend(objc_alloc(*v19), "initWithIOA2Device:userClientID:isSettable:element:scope:dictionary:", v6, v8, !Only, ControlInfo_Element, ControlInfo_Scope, v5);
LABEL_25:
      v26 = v21;
      goto LABEL_26;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v22 = HIBYTE(ControlInfo_BaseClass);
    if ((ControlInfo_BaseClass - 0x20000000) >> 24 >= 0x5F)
      v22 = 32;
    v23 = BYTE2(ControlInfo_BaseClass);
    if (BYTE2(ControlInfo_BaseClass) - 32 >= 0x5F)
      v23 = 32;
    v24 = BYTE1(ControlInfo_BaseClass);
    if (BYTE1(ControlInfo_BaseClass) - 32 >= 0x5F)
      v24 = 32;
    *(_DWORD *)buf = 67110144;
    v29 = ControlInfo_BaseClass;
    v30 = 1024;
    v31 = v22;
    v32 = 1024;
    v33 = v23;
    v34 = 1024;
    v35 = v24;
    if (ControlInfo_BaseClass - 32 >= 0x5F)
      v25 = 32;
    else
      v25 = ControlInfo_BaseClass;
    v36 = 1024;
    v37 = v25;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Warning: Control base class %x ('%c%c%c%c') not supported", buf, 0x20u);
  }
  v26 = 0;
LABEL_26:

  return v26;
}

@end
