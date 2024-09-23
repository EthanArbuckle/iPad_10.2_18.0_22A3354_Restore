@implementation CRXFPrescriptionNameGenerator

- (CRXFPrescriptionNameGenerator)init
{
  CRXFPrescriptionNameGenerator *v2;
  uint64_t v3;
  NSString *defaultLensName;
  uint64_t v5;
  NSString *guestLensName;
  uint64_t v7;
  NSString *demoLensName;
  uint64_t v9;
  NSString *readerLensName;
  uint64_t v11;
  NSString *developerLensName;
  uint64_t v13;
  NSString *prescriptionLensName;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRXFPrescriptionNameGenerator;
  v2 = -[CRXFPrescriptionNameGenerator init](&v16, sel_init);
  if (v2)
  {
    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_DEFAULT"));
    v3 = objc_claimAutoreleasedReturnValue();
    defaultLensName = v2->_defaultLensName;
    v2->_defaultLensName = (NSString *)v3;

    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_GUEST_LENSES"));
    v5 = objc_claimAutoreleasedReturnValue();
    guestLensName = v2->_guestLensName;
    v2->_guestLensName = (NSString *)v5;

    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_DEMO_LENSES"));
    v7 = objc_claimAutoreleasedReturnValue();
    demoLensName = v2->_demoLensName;
    v2->_demoLensName = (NSString *)v7;

    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_READER_LENSES"));
    v9 = objc_claimAutoreleasedReturnValue();
    readerLensName = v2->_readerLensName;
    v2->_readerLensName = (NSString *)v9;

    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_DEVELOPER_LENSES"));
    v11 = objc_claimAutoreleasedReturnValue();
    developerLensName = v2->_developerLensName;
    v2->_developerLensName = (NSString *)v11;

    CRXFLocalizedString(CFSTR("PRESCRIPTION_NAME_PRESCRIPTION_LENSES"));
    v13 = objc_claimAutoreleasedReturnValue();
    prescriptionLensName = v2->_prescriptionLensName;
    v2->_prescriptionLensName = (NSString *)v13;

  }
  return v2;
}

- (id)generatePrescriptionNameForLensType:(unint64_t)a3 userName:(id)a4 inGuestMode:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *demoLensName;
  NSString *v18;
  NSString *v19;

  v5 = a5;
  v8 = a4;
  if (v5)
  {
    v9 = self->_guestLensName;
  }
  else
  {
    v9 = self->_defaultLensName;
    switch(a3)
    {
      case 0uLL:
        demoLensName = self->_demoLensName;
        goto LABEL_15;
      case 1uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(CFSTR("PRESCRIPTION_NAME_READER_LENSES_PERSONALIZED_FORMAT"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
          goto LABEL_11;
        }
        demoLensName = self->_readerLensName;
        goto LABEL_15;
      case 2uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(CFSTR("PRESCRIPTION_NAME_DEVELOPER_LENSES_PERSONALIZED_FORMAT"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
          goto LABEL_11;
        }
        demoLensName = self->_developerLensName;
        goto LABEL_15;
      case 3uLL:
        if (v8)
        {
          CRXFLocalizedStringWithArguments(CFSTR("PRESCRIPTION_NAME_PRESCRIPTION_LENSES_PERSONALIZED_FORMAT"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          demoLensName = self->_prescriptionLensName;
LABEL_15:
          v18 = demoLensName;
        }
        v19 = v18;

        v9 = v19;
        break;
      default:
        break;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prescriptionLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_prescriptionLensName, 0);
  objc_storeStrong((id *)&self->_developerLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_developerLensName, 0);
  objc_storeStrong((id *)&self->_readerLensPersonalizedName, 0);
  objc_storeStrong((id *)&self->_readerLensName, 0);
  objc_storeStrong((id *)&self->_demoLensName, 0);
  objc_storeStrong((id *)&self->_guestLensName, 0);
  objc_storeStrong((id *)&self->_defaultLensName, 0);
}

@end
