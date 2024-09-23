@implementation CNImageDataAvailableDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5DB8];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)a4 + 320), CFSTR("_imageDataAvailable"));
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:length:](CNiOSABConversions, "numberFromIntegerABBytes:length:", a3, a4);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "imageDataAvailable"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setImageDataAvailable:", objc_msgSend(a3, "BOOLValue"));

}

- (CNImageDataAvailableDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("imageDataAvailable"), sel_imageDataAvailable, sel_setImageDataAvailable_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _BYTE *v5;

  v5 = a4;
  v5[320] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_imageDataAvailable"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((_BYTE *)a3 + 320) == 0) ^ (*((_BYTE *)a4 + 320) != 0);
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  _BOOL4 HasImageData;
  void **v4;

  HasImageData = ABPersonHasImageData(a3);
  v4 = (void **)MEMORY[0x1E0C9AE50];
  if (!HasImageData)
    v4 = (void **)MEMORY[0x1E0C9AE40];
  return *v4;
}

@end
