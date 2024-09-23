@implementation EKUIMailUtilities

+ (id)atomPresentationOptionsAsString:(unint64_t)a3
{
  void *v5;
  id v6;
  void (**v7)(void *, unint64_t, _QWORD);
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__EKUIMailUtilities_atomPresentationOptionsAsString___block_invoke;
  v13 = &unk_1E601AD68;
  v15 = a1;
  v6 = v5;
  v14 = v6;
  v7 = (void (**)(void *, unint64_t, _QWORD))_Block_copy(&v10);
  v7[2](v7, a3, 0);
  v7[2](v7, a3, 1);
  v7[2](v7, a3, 2);
  v7[2](v7, a3, 4);
  v7[2](v7, a3, 8);
  v7[2](v7, a3, 16);
  v7[2](v7, a3, 32);
  v7[2](v7, a3, 64);
  v7[2](v7, a3, 128);
  v7[2](v7, a3, 256);
  v7[2](v7, a3, 512);
  v7[2](v7, a3, 1024);
  v7[2](v7, a3, 2048);
  v7[2](v7, a3, 4096);
  v7[2](v7, a3, 0x2000);
  v7[2](v7, a3, 0x4000);
  v7[2](v7, a3, 0x8000);
  v7[2](v7, a3, 0x10000);
  v7[2](v7, a3, 0x20000);
  v7[2](v7, a3, 0x100000);
  objc_msgSend(v6, "appendString:", CFSTR("}"), v10, v11, v12, v13);
  v8 = v6;

  return v8;
}

void __53__EKUIMailUtilities_atomPresentationOptionsAsString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL4 v3;
  id v5;

  v3 = a2 == 0;
  if (a3)
    v3 = (a3 & ~a2) == 0;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_stringForIsolatedAtomPresentationOption:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%@)"), v5);

  }
}

+ (id)_stringForIsolatedAtomPresentationOption:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  result = 0;
  if ((uint64_t)a3 > 511)
  {
    v4 = CFSTR("FaceTimeUnresolved");
    v5 = CFSTR("Invalid Address");
    v6 = CFSTR("Static Identity Verified");
    if (a3 != 0x100000)
      v6 = 0;
    if (a3 != 0x20000)
      v5 = v6;
    if (a3 != 0x10000)
      v4 = v5;
    v7 = CFSTR("DisplayBackgroundOnHover");
    v8 = CFSTR("IsFaceTimeReachable");
    if (a3 != 0x8000)
      v8 = 0;
    if (a3 != 0x4000)
      v7 = v8;
    if ((uint64_t)a3 < 0x10000)
      v4 = v7;
    v9 = CFSTR("UnavailableIcon");
    v10 = CFSTR("UnknownCircleIcon");
    v11 = CFSTR("UnknownCircleIcon");
    if (a3 != 0x2000)
      v11 = 0;
    if (a3 != 4096)
      v10 = v11;
    if (a3 != 2048)
      v9 = v10;
    v12 = CFSTR("PendingLeading");
    v13 = CFSTR("AvailableIcon");
    if (a3 != 1024)
      v13 = 0;
    if (a3 != 512)
      v12 = v13;
    if ((uint64_t)a3 <= 2047)
      v9 = v12;
    if ((uint64_t)a3 < 0x4000)
      return (id)v9;
    else
      return (id)v4;
  }
  else if ((uint64_t)a3 > 15)
  {
    v14 = CFSTR("InsecureIcon");
    v15 = CFSTR("SecureIcon");
    v16 = CFSTR("UnverifiedIcon");
    if (a3 != 256)
      v16 = 0;
    if (a3 != 128)
      v15 = v16;
    if (a3 != 64)
      v14 = v15;
    v17 = CFSTR("VIPIcon");
    v18 = CFSTR("SignedIcon");
    if (a3 != 32)
      v18 = 0;
    if (a3 != 16)
      v17 = v18;
    if ((uint64_t)a3 <= 63)
      return (id)v17;
    else
      return (id)v14;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        result = CFSTR("None");
        break;
      case 1uLL:
        result = CFSTR("FailureColor");
        break;
      case 2uLL:
        result = CFSTR("IsSMS");
        break;
      case 4uLL:
        result = CFSTR("Pending|PendingTrailing");
        break;
      case 8uLL:
        result = CFSTR("Disabled");
        break;
      default:
        return result;
    }
  }
  return result;
}

@end
