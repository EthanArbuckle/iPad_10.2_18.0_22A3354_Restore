@implementation ASDTIOA2Control

+ (id)controlWithDictionary:(id)a3 owningDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const applesauce::CF::DictionaryRef *v11;
  const __CFDictionary *ControlInfo_Class;
  const applesauce::CF::DictionaryRef *v13;
  int ControlInfo_BaseClass;
  const applesauce::CF::DictionaryRef *v15;
  uint64_t ControlInfo_Scope;
  const applesauce::CF::DictionaryRef *v17;
  uint64_t ControlInfo_Element;
  const applesauce::CF::DictionaryRef *v19;
  _BOOL4 Only;
  __objc2_class **v21;
  __objc2_class **v22;
  ASDTIOA2BlockControl *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  ASDTIOA2BlockControl *v28;
  CFTypeRef cf;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (v7)
    CFRetain(v7);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("control ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  ControlInfo_Class = ASDT::IOA2UserClient::GetControlInfo_Class((const __CFDictionary **)&cf, v11);
  ControlInfo_BaseClass = ASDT::IOA2UserClient::GetControlInfo_BaseClass((const __CFDictionary **)&cf, v13);
  ControlInfo_Scope = ASDT::IOA2UserClient::GetControlInfo_Scope((const __CFDictionary **)&cf, v15);
  ControlInfo_Element = ASDT::IOA2UserClient::GetControlInfo_Element((const __CFDictionary **)&cf, v17);
  Only = ASDT::IOA2UserClient::GetControlInfo_IsReadOnly((ASDT::IOA2UserClient *)&cf, v19);
  if (ControlInfo_BaseClass <= 1936483187)
  {
    if (ControlInfo_BaseClass == 1651273579)
    {
      v23 = -[ASDTIOA2BlockControl initWithIOA2Device:userClientID:isSettable:forElement:inScope:objectClassID:]([ASDTIOA2BlockControl alloc], "initWithIOA2Device:userClientID:isSettable:forElement:inScope:objectClassID:", v6, v10, !Only, ControlInfo_Element, ControlInfo_Scope, ControlInfo_Class);
      goto LABEL_36;
    }
    if (ControlInfo_BaseClass != 1818588780)
      goto LABEL_18;
    v22 = off_25084AB00;
LABEL_16:
    v23 = (ASDTIOA2BlockControl *)objc_msgSend(objc_alloc(*v22), "initWithIOA2Device:userClientID:isSettable:forElement:inScope:objectClassID:dictionary:", v6, v10, !Only, ControlInfo_Element, ControlInfo_Scope, ControlInfo_Class, v8);
LABEL_36:
    v28 = v23;
    goto LABEL_37;
  }
  switch(ControlInfo_BaseClass)
  {
    case 1936483188:
      v22 = off_25084AB20;
      goto LABEL_16;
    case 1936483442:
      v22 = off_25084AB30;
      goto LABEL_16;
    case 1953458028:
      if ((int)ControlInfo_Class > 1885888877)
      {
        if ((_DWORD)ControlInfo_Class == 1885888878)
        {
          v21 = off_25084AB10;
          goto LABEL_35;
        }
        if ((_DWORD)ControlInfo_Class == 1885893481)
        {
          v21 = off_25084AB18;
          goto LABEL_35;
        }
      }
      else
      {
        if ((_DWORD)ControlInfo_Class == 1784767339)
        {
          v21 = off_25084AAC0;
          goto LABEL_35;
        }
        if ((_DWORD)ControlInfo_Class == 1836414053)
        {
          v21 = off_25084AB08;
LABEL_35:
          v23 = (ASDTIOA2BlockControl *)objc_msgSend(objc_alloc(*v21), "initWithIOA2Device:userClientID:isSettable:element:scope:dictionary:", v6, v10, !Only, ControlInfo_Element, ControlInfo_Scope, v8);
          goto LABEL_36;
        }
      }
      v23 = -[ASDTIOA2BooleanControl initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:]([ASDTIOA2BooleanControl alloc], "initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:", v6, v10, !Only, ControlInfo_Element, ControlInfo_Scope, ControlInfo_Class, v8);
      goto LABEL_36;
  }
LABEL_18:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v24 = HIBYTE(ControlInfo_BaseClass);
    if ((ControlInfo_BaseClass - 0x20000000) >> 24 >= 0x5F)
      v24 = 32;
    v25 = BYTE2(ControlInfo_BaseClass);
    if (BYTE2(ControlInfo_BaseClass) - 32 >= 0x5F)
      v25 = 32;
    v26 = BYTE1(ControlInfo_BaseClass);
    if (BYTE1(ControlInfo_BaseClass) - 32 >= 0x5F)
      v26 = 32;
    *(_DWORD *)buf = 67110144;
    v32 = ControlInfo_BaseClass;
    v33 = 1024;
    v34 = v24;
    v35 = 1024;
    v36 = v25;
    v37 = 1024;
    v38 = v26;
    if (ControlInfo_BaseClass - 32 >= 0x5F)
      v27 = 32;
    else
      v27 = ControlInfo_BaseClass;
    v39 = 1024;
    v40 = v27;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Warning: Control base class %x ('%c%c%c%c') not supported", buf, 0x20u);
  }
  v28 = 0;
LABEL_37:
  if (cf)
    CFRelease(cf);

  return v28;
}

@end
