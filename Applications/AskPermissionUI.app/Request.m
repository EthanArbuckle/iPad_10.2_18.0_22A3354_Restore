@implementation Request

- (Request)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemBundleIdentifier:(id)a6 itemIdentifier:(id)a7 localizations:(id)a8 mocked:(BOOL)a9 offerName:(id)a10 previewURL:(id)a11 productType:(id)a12 productTypeName:(id)a13 productURL:(id)a14 requestInfo:(id)a15 status:(int64_t)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  Request *v28;
  Request *v29;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v32 = a4;
  v39 = a4;
  v33 = a5;
  v37 = a5;
  v34 = a6;
  v21 = a6;
  v35 = a7;
  v22 = a7;
  v40 = a8;
  v38 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = a15;
  v42.receiver = self;
  v42.super_class = (Class)Request;
  v28 = -[Request init](&v42, "init");
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_date, a3);
    objc_storeStrong((id *)&v29->_requestIdentifier, v32);
    objc_storeStrong((id *)&v29->_uniqueIdentifier, v33);
    objc_storeStrong((id *)&v29->_itemBundleIdentifier, v34);
    objc_storeStrong((id *)&v29->_itemIdentifier, v35);
    objc_storeStrong((id *)&v29->_localizations, a8);
    v29->_mocked = a9;
    objc_storeStrong((id *)&v29->_offerName, a10);
    objc_storeStrong((id *)&v29->_previewURL, a11);
    objc_storeStrong((id *)&v29->_productType, a12);
    objc_storeStrong((id *)&v29->_productTypeName, a13);
    objc_storeStrong((id *)&v29->_productURL, a14);
    objc_storeStrong((id *)&v29->_requestInfo, a15);
    v29->_status = a16;
  }

  return v29;
}

- (Request)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  RequestLocalizations *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  unsigned __int8 v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  RequestLocalizations *v67;
  id v68;
  Request *v69;
  void *v70;
  Request *v71;
  id v72;
  void *v73;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date")));
  v6 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
LABEL_5:
    v73 = v7;
    goto LABEL_7;
  }
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_5;
  }
  v73 = 0;
LABEL_7:

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")));
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v72 = v9;
  else
    v72 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier")));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v68 = v11;
  else
    v68 = 0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier")));
  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemBundleIdentifier")));
  v17 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = v16;
  else
    v18 = 0;
  v65 = v18;

  v19 = [RequestLocalizations alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizations")));
  v21 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    v22 = v20;
  else
    v22 = 0;

  v67 = -[RequestLocalizations initWithDictionary:](v19, "initWithDictionary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mocked")));
  v24 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    v25 = v23;
  else
    v25 = 0;

  v62 = objc_msgSend(v25, "BOOLValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerName")));
  v27 = objc_opt_class(NSString);
  v71 = self;
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    v28 = v26;
  else
    v28 = 0;

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewURL")));
  v30 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
  {
    v31 = v29;
LABEL_32:
    v33 = v31;
    goto LABEL_34;
  }
  v32 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v29, v32) & 1) != 0)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v29));
    goto LABEL_32;
  }
  v33 = 0;
LABEL_34:

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType")));
  v35 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
    v36 = v34;
  else
    v36 = 0;

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productTypeName")));
  v38 = objc_opt_class(NSString);
  v64 = v28;
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
    v39 = v37;
  else
    v39 = 0;

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productURL")));
  v41 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0)
  {
    v42 = v40;
LABEL_44:
    v44 = v42;
    goto LABEL_46;
  }
  v43 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v40, v43) & 1) != 0)
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v40));
    goto LABEL_44;
  }
  v44 = 0;
LABEL_46:

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestInfo")));
  v46 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0)
    v47 = v45;
  else
    v47 = 0;

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v49 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
    v50 = v48;
  else
    v50 = 0;
  v63 = v36;

  if (v50)
    v51 = (uint64_t)objc_msgSend(v50, "integerValue");
  else
    v51 = -2;
  v52 = v68;
  v53 = v33;
  v54 = v39;
  v70 = v4;
  v66 = v33;
  if (v73 && v72 && v68 && v15 && v67)
  {
    v56 = v47;
    v55 = v63;
    v57 = v64;
    LOBYTE(v61) = v62;
    v58 = v65;
    v59 = v54;
    v71 = -[Request initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:](v71, "initWithDate:requestIdentifier:uniqueIdentifier:itemBundleIdentifier:itemIdentifier:localizations:mocked:offerName:previewURL:productType:productTypeName:productURL:requestInfo:status:", v73, v72, v68, v65, v15, v67, v61, v64, v53, v63, v54, v44, v47, v51);
    v69 = v71;
  }
  else
  {
    v57 = v64;
    v58 = v65;
    v56 = v47;
    v55 = v63;
    v59 = v54;
    v69 = 0;
  }

  return v69;
}

- (id)compile
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Request date](self, "date"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, CFSTR("date"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Request requestIdentifier](self, "requestIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Request uniqueIdentifier](self, "uniqueIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, CFSTR("uniqueIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Request itemBundleIdentifier](self, "itemBundleIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, CFSTR("itemBundleIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Request itemIdentifier](self, "itemIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v8, CFSTR("itemIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Request localizations](self, "localizations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compile"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, CFSTR("localizations"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[Request isMocked](self, "isMocked")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, CFSTR("mocked"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[Request offerName](self, "offerName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v12, CFSTR("offerName"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[Request previewURL](self, "previewURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v14, CFSTR("previewURL"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[Request productType](self, "productType"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v15, CFSTR("productType"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[Request productTypeName](self, "productTypeName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v16, CFSTR("productTypeName"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[Request productURL](self, "productURL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v18, CFSTR("productURL"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[Request requestInfo](self, "requestInfo"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v19, CFSTR("requestInfo"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[Request status](self, "status")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v20, CFSTR("status"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Request compile](self, "compile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Request ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)itemBundleIdentifier
{
  return self->_itemBundleIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (BOOL)isMocked
{
  return self->_mocked;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_itemBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
