@implementation NSDate(NSDate)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)encodeWithCoder:()NSDate
{
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    return objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.time"));
  }
  else
  {
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    v7[0] = v6;
    return objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", v7);
  }
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)initWithCoder:()NSDate
{
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.time"));
    return objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v6[0] = 0.0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", v6, 8);
    return objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:", v6[0]);
  }
}

@end
