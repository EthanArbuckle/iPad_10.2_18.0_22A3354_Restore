@implementation APClientInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_locationInfo, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_scale, 0);
}

- (void)updateActiveClientInfo
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  id v6;

  objc_msgSend_nonUICopy(self, a2, v2, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActiveClientInfo_(APClientInfo, v4, (uint64_t)v6, v5);

}

+ (void)setActiveClientInfo:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&qword_1ED2BC960, a3);
  if (qword_1ED2BC7A0)
    objc_msgSend_activeClientInfoUpdated_((void *)qword_1ED2BC7A0, v6, (uint64_t)v8, v7);
  objc_sync_exit(v5);

}

+ (APClientInfo)activeClientInfo
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)qword_1ED2BC960;
  objc_msgSend_sharedInstance(APLocationManager, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locationInfo(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationInfo_(v3, v12, (uint64_t)v11, v13);

  objc_msgSend_sharedInstance(APLocationManager, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_locationEnabled(v17, v18, v19, v20);
  objc_msgSend_setIsLocationAvailableForAd_(v3, v22, v21, v23);

  v24 = (id)qword_1ED2BC960;
  objc_sync_exit(v2);

  return (APClientInfo *)v24;
}

- (void)setLocationInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setIsLocationAvailableForAd:(BOOL)a3
{
  self->_isLocationAvailableForAd = a3;
}

- (APClientInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  APClientInfo *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSNumber *scale;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSArray *keyboards;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  APLocationInfo *locationInfo;
  const char *v34;
  uint64_t v35;

  v4 = a3;
  v10 = (APClientInfo *)objc_msgSend_init(self, v5, v6, v7);
  if (v10)
  {
    v10->_orientation = (int)objc_msgSend_decodeIntForKey_(v4, v8, (uint64_t)CFSTR("orientation"), v9);
    v10->_interfaceIdiom = (int)objc_msgSend_decodeIntForKey_(v4, v11, (uint64_t)CFSTR("interfaceIdiom"), v12);
    v10->_screenHeight = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("screenHeight"), v14);
    v10->_screenWidth = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("screenWidth"), v16);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("scale"));
    v19 = objc_claimAutoreleasedReturnValue();
    scale = v10->_scale;
    v10->_scale = (NSNumber *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend_setWithObjects_(v21, v24, v22, v25, v23, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("keyboards"));
    v28 = objc_claimAutoreleasedReturnValue();
    keyboards = v10->_keyboards;
    v10->_keyboards = (NSArray *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("locationInfo"));
    v32 = objc_claimAutoreleasedReturnValue();
    locationInfo = v10->_locationInfo;
    v10->_locationInfo = (APLocationInfo *)v32;

    v10->_isLocationAvailableForAd = objc_msgSend_decodeBoolForKey_(v4, v34, (uint64_t)CFSTR("locationAvailableForAd"), v35);
  }

  return v10;
}

- (id)nonUICopy
{
  APClientInfo *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;

  v3 = objc_alloc_init(APClientInfo);
  v7 = objc_msgSend_orientation(self, v4, v5, v6);
  objc_msgSend_setOrientation_(v3, v8, v7, v9);
  v13 = objc_msgSend_interfaceIdiom(self, v10, v11, v12);
  objc_msgSend_setInterfaceIdiom_(v3, v14, v13, v15);
  v19 = objc_msgSend_screenHeight(self, v16, v17, v18);
  objc_msgSend_setScreenHeight_(v3, v20, v19, v21);
  v25 = objc_msgSend_screenWidth(self, v22, v23, v24);
  objc_msgSend_setScreenWidth_(v3, v26, v25, v27);
  objc_msgSend_scale(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScale_(v3, v32, (uint64_t)v31, v33);

  objc_msgSend_keyboards(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboards_(v3, v38, (uint64_t)v37, v39);

  objc_msgSend_locationInfo(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationInfo_(v3, v44, (uint64_t)v43, v45);

  return v3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_orientation(self, a2, v2, v3);
  v10 = objc_msgSend_interfaceIdiom(self, v7, v8, v9);
  v14 = objc_msgSend_screenHeight(self, v11, v12, v13);
  v18 = objc_msgSend_screenWidth(self, v15, v16, v17);
  objc_msgSend_scale(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyboards(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locationInfo(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appVersion(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v35, (uint64_t)CFSTR("APClientInfo: \norientation: %ld\ninterfaceIdiom: %ld\nscreenHeight: %ld\nscreenWidth: %ld\nscale: %@\nkeyboards: %@\nlocationInfo: %@\nappVersion: %@"), v36, v6, v10, v14, v18, v22, v26, v30, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t isLocationAvailableForAd;
  const char *v43;
  id v44;

  v44 = a3;
  v7 = objc_msgSend_orientation(self, v4, v5, v6);
  objc_msgSend_encodeInt_forKey_(v44, v8, v7, (uint64_t)CFSTR("orientation"));
  v12 = objc_msgSend_interfaceIdiom(self, v9, v10, v11);
  objc_msgSend_encodeInt_forKey_(v44, v13, v12, (uint64_t)CFSTR("interfaceIdiom"));
  v17 = objc_msgSend_screenHeight(self, v14, v15, v16);
  objc_msgSend_encodeInteger_forKey_(v44, v18, v17, (uint64_t)CFSTR("screenHeight"));
  v22 = objc_msgSend_screenWidth(self, v19, v20, v21);
  objc_msgSend_encodeInteger_forKey_(v44, v23, v22, (uint64_t)CFSTR("screenWidth"));
  objc_msgSend_scale(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v44, v28, (uint64_t)v27, (uint64_t)CFSTR("scale"));

  objc_msgSend_keyboards(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v44, v33, (uint64_t)v32, (uint64_t)CFSTR("keyboards"));

  objc_msgSend_locationInfo(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v44, v38, (uint64_t)v37, (uint64_t)CFSTR("locationInfo"));

  isLocationAvailableForAd = objc_msgSend_isLocationAvailableForAd(self, v39, v40, v41);
  objc_msgSend_encodeBool_forKey_(v44, v43, isLocationAvailableForAd, (uint64_t)CFSTR("locationAvailableForAd"));

}

- (int64_t)interfaceIdiom
{
  return self->_interfaceIdiom;
}

- (int64_t)screenHeight
{
  return self->_screenHeight;
}

- (int64_t)screenWidth
{
  return self->_screenWidth;
}

- (NSNumber)scale
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (APLocationInfo)locationInfo
{
  return (APLocationInfo *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSArray)keyboards
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isLocationAvailableForAd
{
  return self->_isLocationAvailableForAd;
}

- (NSString)appVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScreenWidth:(int64_t)a3
{
  self->_screenWidth = a3;
}

- (void)setScreenHeight:(int64_t)a3
{
  self->_screenHeight = a3;
}

- (void)setScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setKeyboards:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setInterfaceIdiom:(int64_t)a3
{
  self->_interfaceIdiom = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&qword_1ED2BC7A0, a3);
}

- (id)jsonRepresentationWithOptions:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v57;
  void *v58;
  _QWORD v59[7];
  _QWORD v60[8];

  v60[7] = *MEMORY[0x1E0C80C00];
  v59[0] = CFSTR("orientation");
  v5 = (void *)0x1E0CB3000;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_orientation(self, a2, a3, v3);
  objc_msgSend_numberWithInteger_(v6, v8, v7, v9);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v58;
  v59[1] = CFSTR("interfaceIdiom");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_interfaceIdiom(self, v11, v12, v13);
  objc_msgSend_numberWithInteger_(v10, v15, v14, v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v57;
  v59[2] = CFSTR("screenHeight");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v21 = objc_msgSend_screenHeight(self, v18, v19, v20);
  objc_msgSend_numberWithInteger_(v17, v22, v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v24;
  v59[3] = CFSTR("screenWidth");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  v29 = objc_msgSend_screenWidth(self, v26, v27, v28);
  objc_msgSend_numberWithInteger_(v25, v30, v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v32;
  v59[4] = CFSTR("scale");
  objc_msgSend_scale(self, v33, v34, v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (!v39)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v36, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60[4] = v40;
  v59[5] = CFSTR("keyboards");
  objc_msgSend_keyboards(self, v36, v37, v38);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v41, v42, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60[5] = v45;
  v59[6] = CFSTR("locationInfo");
  objc_msgSend_locationInfo(self, v41, v42, v43);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend_locationInfo(self, v46, v47, v48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_jsonRepresentationWithOptions_(v5, v50, a3, v51);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v46, v47, v48);
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v52;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)v60, (uint64_t)v59, 7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {

    v52 = v5;
  }

  if (!v44)
  if (!v39)

  return v54;
}

+ (APClientInfoDelegate)delegate
{
  return (APClientInfoDelegate *)(id)qword_1ED2BC7A0;
}

- (id)redactedDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_orientation(self, a2, v2, v3);
  v10 = objc_msgSend_interfaceIdiom(self, v7, v8, v9);
  v14 = objc_msgSend_screenHeight(self, v11, v12, v13);
  v18 = objc_msgSend_screenWidth(self, v15, v16, v17);
  objc_msgSend_scale(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyboards(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appVersion(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v31, (uint64_t)CFSTR("APClientInfo: \norientation: %ld\ninterfaceIdiom: %ld\nscreenHeight: %ld\nscreenWidth: %ld\nscale: %@\nkeyboards: %@\nlocationInfo: <redacted>\nappVersion: %@"), v32, v6, v10, v14, v18, v22, v26, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

@end
