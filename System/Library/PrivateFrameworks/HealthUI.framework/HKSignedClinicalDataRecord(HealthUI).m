@implementation HKSignedClinicalDataRecord(HealthUI)

- (id)issuerDisplayStringWithSignatureStatusGlyph
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a1, "isExpired"))
  {
    objc_msgSend(a1, "expiredAttributedString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(a1, "signatureStatus");
    if (v3 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.seal.fill"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 2)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      }
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    objc_msgSend(v4, "imageWithTintColor:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "recordIssuerDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_attributedStringPrefixedWithImage:spacing:", v7, 2.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)signatureStatusDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (objc_msgSend(a1, "isExpired"))
  {
    objc_msgSend(a1, "expiredAttributedString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    switch(objc_msgSend(a1, "signatureStatus"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED");
        goto LABEL_7;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED_UNABLE_TO");
LABEL_7:
        objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SIGNATURE_STATUS_VERIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SIGNATURE_STATUS_NOT_VERIFIED_INVALID"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.seal.fill"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v11 = (void *)v9;
        objc_msgSend(v8, "imageWithTintColor:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_12;
        objc_msgSend(v6, "hk_attributedStringPrefixedWithImage:spacing:", v12, 2.0);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v6 = 0;
LABEL_12:
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
        break;
    }

  }
  return v2;
}

- (BOOL)isExpired
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "expirationDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "earlierDate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == v1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)expiredAttributedString
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_SIGNATURE_STATUS_EXPIRED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.seal.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "hk_attributedStringPrefixedWithImage:spacing:", v4, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
