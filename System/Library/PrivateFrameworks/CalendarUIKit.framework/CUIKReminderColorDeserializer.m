@implementation CUIKReminderColorDeserializer

void __CUIKReminderColorDeserializer_block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getCUIKIReminderColorDeserializerClass_softClass;
  v8 = getCUIKIReminderColorDeserializerClass_softClass;
  if (!getCUIKIReminderColorDeserializerClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getCUIKIReminderColorDeserializerClass_block_invoke;
    v4[3] = &unk_1E6EB6F70;
    v4[4] = &v5;
    __getCUIKIReminderColorDeserializerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)CUIKReminderColorDeserializer_deserializer;
  CUIKReminderColorDeserializer_deserializer = (uint64_t)v2;

}

@end
