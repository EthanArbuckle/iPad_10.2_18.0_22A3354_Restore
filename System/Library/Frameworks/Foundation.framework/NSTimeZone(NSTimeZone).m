@implementation NSTimeZone(NSTimeZone)

- (uint64_t)initWithCoder:()NSTimeZone
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.name"));
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.data"));
    if (_NSIsNSString() && (!v6 || (_NSIsNSData() & 1) != 0))
      return objc_msgSend(a1, "initWithName:data:", v5, v6);
    goto LABEL_14;
  }
  if (objc_msgSend(a3, "versionForClassName:", CFSTR("NSTimeZone")))
  {
    v12 = 0;
    v13[0] = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", v13, 8);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", &v12, 8);
    if (_NSIsNSString())
    {
      if (!v12)
      {
        v8 = 0;
        goto LABEL_16;
      }
      if (_NSIsNSData())
      {
        v8 = v12;
LABEL_16:
        v10 = objc_msgSend(a1, "initWithName:data:", v13[0], v8);

        v11 = v12;
LABEL_19:

        return v10;
      }
    }
  }
  else
  {
    v13[0] = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", v13, 8);
    if (_NSIsNSString())
    {
      v9 = (id)objc_msgSend((id)objc_opt_class(), "timeZoneWithAbbreviation:", v13[0]);
      if (v9)
      {
        v10 = (uint64_t)v9;

      }
      else
      {
        v10 = objc_msgSend(a1, "initWithName:", v13[0]);
      }
      v11 = v13[0];
      goto LABEL_19;
    }
  }
LABEL_14:
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, 0));

  return 0;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (uint64_t)encodeWithCoder:()NSTimeZone
{
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "name"), CFSTR("NS.name"));
    return objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "data"), CFSTR("NS.data"));
  }
  else
  {
    v6[0] = objc_msgSend(a1, "name");
    return objc_msgSend(a3, "encodeValueOfObjCType:at:", "@", v6);
  }
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end
