@implementation EQKitAdjustableSpace

- (EQKitAdjustableSpace)initWithAscent:(double)a3 descent:(double)a4 width:(double)a5
{
  EQKitAdjustableSpace *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EQKitAdjustableSpace;
  result = -[EQKitAdjustableSpace init](&v9, sel_init);
  if (result)
  {
    result->mAscent = a3;
    result->mDescent = a4;
    result->mWidth = a5;
  }
  return result;
}

+ (__CTRunDelegate)newRunDelegateWithAscent:(double)a3 descent:(double)a4 width:(double)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAscent:descent:width:", a3, a4, a5);
  return CTRunDelegateCreate(&kEQKitRunDelegateCallBacks, v5);
}

+ (void)appendSpaceToAttributedString:(id)a3 ascent:(double)a4 descent:(double)a5 width:(double)a6
{
  void *v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(a1, "newRunDelegateWithAscent:descent:width:", a4, a5, a6);
  v8 = (void *)*MEMORY[0x24BDC4EE8];
  keys[0] = *(void **)MEMORY[0x24BDC4F28];
  keys[1] = v8;
  v9 = (void *)*MEMORY[0x24BDBD270];
  values[0] = v7;
  values[1] = v9;
  v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, 0, MEMORY[0x24BDBD6B0]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &kRunDelegateCharacter, 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v10);
  objc_msgSend(a3, "appendAttributedString:", v12);
  CFRelease(v7);
  CFRelease(v10);

}

- (double)ascent
{
  return self->mAscent;
}

- (double)descent
{
  return self->mDescent;
}

- (double)width
{
  return self->mWidth;
}

@end
