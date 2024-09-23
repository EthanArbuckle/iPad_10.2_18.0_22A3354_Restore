@implementation LSRegistrationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  id v5;

  version = self->version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->action, CFSTR("action"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->options, CFSTR("options"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->itemFlags, CFSTR("itemFlags"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->containerUnit, CFSTR("containerUnit"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bundleUnit, CFSTR("bundleUnit"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->bundleClass, CFSTR("bundleClass"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->inoBundle, CFSTR("inoBundle"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->inoExec, CFSTR("inoExec"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("contentModDate"), self->contentModDate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("execContentModDate"), self->executableModDate);

}

- (LSRegistrationInfo)initWithCoder:(id)a3
{
  id v4;
  LSRegistrationInfo *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = -[LSRegistrationInfo init](self, "init");
  if (v5)
  {
    v5->version = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
    v5->action = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("action"));
    v5->options = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("options"));
    v5->itemFlags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemFlags"));
    v5->containerUnit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("containerUnit"));
    v5->bundleUnit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bundleUnit"));
    v5->bundleClass = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bundleClass"));
    v5->inoBundle = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("inoBundle"));
    v5->inoExec = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("inoExec"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("contentModDate"));
    v5->contentModDate = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("execContentModDate"));
    v5->executableModDate = v7;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_DWORD *)result + 2) = self->version;
    *((_DWORD *)result + 3) = self->action;
    *((_DWORD *)result + 4) = self->options;
    *((_DWORD *)result + 5) = self->itemFlags;
    *((_DWORD *)result + 6) = self->containerUnit;
    *((_DWORD *)result + 7) = self->bundleUnit;
    *((_DWORD *)result + 8) = self->bundleClass;
    *((_QWORD *)result + 5) = self->inoBundle;
    *((_QWORD *)result + 6) = self->inoExec;
    *((_QWORD *)result + 7) = *(_QWORD *)&self->contentModDate;
    *((_QWORD *)result + 8) = *(_QWORD *)&self->executableModDate;
  }
  return result;
}

@end
