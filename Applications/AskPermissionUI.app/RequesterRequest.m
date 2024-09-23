@implementation RequesterRequest

- (RequesterRequest)initWithDate:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5 itemIdentifier:(id)a6 localizations:(id)a7 offerName:(id)a8 status:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  RequesterRequest *v19;
  RequesterRequest *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)RequesterRequest;
  v19 = -[RequesterRequest init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_date, a3);
    objc_storeStrong((id *)&v20->_requestIdentifier, a4);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v20->_itemIdentifier, a6);
    objc_storeStrong((id *)&v20->_localizations, a7);
    objc_storeStrong((id *)&v20->_offerName, a8);
    v20->_status = a9;
  }

  return v20;
}

- (RequesterRequest)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
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
  RequestLocalizations *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  RequesterRequest *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date")));
  v6 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
LABEL_5:
    v9 = v7;
    goto LABEL_7;
  }
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")));
  v11 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier")));
  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier")));
  v17 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = v16;
  else
    v18 = 0;

  v19 = [RequestLocalizations alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizations")));
  v21 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    v22 = v20;
  else
    v22 = 0;

  v23 = -[RequestLocalizations initWithDictionary:](v19, "initWithDictionary:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerName")));
  v25 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
    v26 = v24;
  else
    v26 = 0;

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v28 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
    v29 = v27;
  else
    v29 = 0;

  if (v29)
    v30 = (uint64_t)objc_msgSend(v29, "integerValue");
  else
    v30 = -2;
  v31 = 0;
  if (v9 && v12 && v15 && v18 && v23)
  {
    self = -[RequesterRequest initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:](self, "initWithDate:requestIdentifier:uniqueIdentifier:itemIdentifier:localizations:offerName:status:", v9, v12, v15, v18, v23, v26, v30);
    v31 = self;
  }

  return v31;
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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest date](self, "date"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, CFSTR("date"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest requestIdentifier](self, "requestIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest uniqueIdentifier](self, "uniqueIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, CFSTR("uniqueIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest itemIdentifier](self, "itemIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, CFSTR("itemIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest localizations](self, "localizations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "compile"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v9, CFSTR("localizations"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest offerName](self, "offerName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, CFSTR("offerName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RequesterRequest status](self, "status")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, CFSTR("status"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest compile](self, "compile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRequest ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
