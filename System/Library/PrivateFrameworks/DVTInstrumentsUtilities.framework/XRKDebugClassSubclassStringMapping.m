@implementation XRKDebugClassSubclassStringMapping

+ (id)kDebugClassNameForClass:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = a3;
  if (qword_25583C708 != -1)
    dispatch_once(&qword_25583C708, &unk_24EDC2AB0);
  return (id)objc_msgSend_objectForIntegerKey_((void *)qword_25583C700, a2, v5, v3, v4);
}

+ (id)kDebugSubclassNameForClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  if (qword_25583C718 != -1)
    dispatch_once(&qword_25583C718, &unk_24EDC3F18);
  objc_msgSend_objectForIntegerKey_((void *)qword_25583C710, a2, v6, a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_msgSend_objectForIntegerKey_(v7, v8, v5, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
