@implementation _IKJSInspectorSynchronousNetworkRequestRecord

- (_IKJSInspectorSynchronousNetworkRequestRecord)initWithIdentifier:(id)a3 loader:(id)a4 resourceType:(int64_t)a5 initiatorType:(int64_t)a6
{
  id v11;
  id v12;
  _IKJSInspectorSynchronousNetworkRequestRecord *v13;
  _IKJSInspectorSynchronousNetworkRequestRecord *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKJSInspectorSynchronousNetworkRequestRecord;
  v13 = -[_IKJSInspectorSynchronousNetworkRequestRecord init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_isRedirecting = 0;
    v13->_state = 0;
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeWeak((id *)&v14->_loader, v12);
    v14->_resourceType = a5;
    v14->_initiatorType = a6;
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier = %@, loader = %@, resourceType = %ld, initiatorType = %ld>"), v5, self, v6, v7, -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"), -[_IKJSInspectorSynchronousNetworkRequestRecord initiatorType](self, "initiatorType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_processEventType:(int64_t)a3
{
  int64_t v3;

  if ((unint64_t)a3 > 6)
    v3 = 0;
  else
    v3 = qword_1D96A7AA8[a3];
  self->_state = v3;
}

- (void)_dispatchEvent:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v6 = (void (**)(id, id))a4;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _processEventType:](self, "_processEventType:", a3);
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)willSendRequest:(id)a3
{
  -[_IKJSInspectorSynchronousNetworkRequestRecord willSendRequest:redirectResponse:](self, "willSendRequest:redirectResponse:", a3, 0);
}

- (void)willSendRequest:(id)a3 redirectResponse:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  NSDate *startTime;
  NSDate *v10;
  NSDate *redirectEndTime;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _IKJSInspectorSynchronousNetworkRequestRecord *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  int64_t v50;
  double v51;
  double v52;

  v6 = a3;
  v7 = a4;
  if (!self->_startTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v8;

  }
  if (v7 && !self->_isRedirecting)
    self->_isRedirecting = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  redirectEndTime = self->_redirectEndTime;
  self->_redirectEndTime = v10;

  -[_IKJSInspectorSynchronousNetworkRequestRecord setURLRequest:](self, "setURLRequest:", v6);
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controller");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[_IKJSInspectorSynchronousNetworkRequestRecord initiatorType](self, "initiatorType");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9650]), "initWithType:", v14);
  objc_msgSend(MEMORY[0x1E0DD9660], "ik_networkRequestFromURLRequest:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = v18;

  objc_msgSend(v39, "inspectorConnectDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  v22 = v19 - v21;

  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "parentIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "absoluteString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType");
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __82___IKJSInspectorSynchronousNetworkRequestRecord_willSendRequest_redirectResponse___block_invoke;
  v40[3] = &unk_1E9F4D768;
  v41 = v7;
  v42 = v6;
  v43 = self;
  v44 = v27;
  v45 = v24;
  v46 = v26;
  v47 = v29;
  v48 = v16;
  v51 = v22;
  v52 = v19;
  v49 = v15;
  v50 = v30;
  v31 = v15;
  v32 = v16;
  v33 = v29;
  v34 = v26;
  v35 = v24;
  v36 = v27;
  v37 = v6;
  v38 = v7;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 0, v40);

}

- (void)didReceiveResponse:(id)a3 timingData:(id)a4
{
  id v6;
  id v7;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a4;
  v7 = a3;
  -[_IKJSInspectorSynchronousNetworkRequestRecord setURLResponse:](self, "setURLResponse:", v7);
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "agent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DD9670];
  -[_IKJSInspectorSynchronousNetworkRequestRecord urlRequest](self, "urlRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ik_responseFromURLResponse:forRequest:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v6, "mutableCopy");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_startTime, "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("IKJSNetworkRequestRecordStartTime"));

  if (self->_isRedirecting)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](self->_startTime, "timeIntervalSinceReferenceDate");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("IKJSNetworkRequestRecordRedirectStartTime"));

    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceReferenceDate](self->_redirectEndTime, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("IKJSNetworkRequestRecordRedirectEndTime"));

  }
  -[_IKJSInspectorSynchronousNetworkRequestRecord setTimingData:](self, "setTimingData:", v14);
  v21 = (void *)MEMORY[0x1E0DD9668];
  -[_IKJSInspectorSynchronousNetworkRequestRecord timingData](self, "timingData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inspectorConnectDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ik_networkResourceTimingFromData:referenceStartDate:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v13, "setTiming:", v24);
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentTimeIntervalSince1970");
  v28 = v27;

  v29 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __79___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveResponse_timingData___block_invoke;
  v32[3] = &unk_1E9F4D790;
  v35 = v28;
  v36 = v29;
  v33 = v25;
  v34 = v13;
  v30 = v13;
  v31 = v25;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 2, v32);

}

- (void)didReceiveData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  int v13;

  v4 = a3;
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTimeIntervalSince1970");
  v8 = v7;

  LODWORD(v6) = objc_msgSend(v4, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveData___block_invoke;
  v10[3] = &unk_1E9F4D7B8;
  v11 = v5;
  v12 = v8;
  v13 = (int)v6;
  v9 = v5;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 3, v10);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTimeIntervalSince1970");
  v8 = v7;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66___IKJSInspectorSynchronousNetworkRequestRecord_didFailWithError___block_invoke;
  v11[3] = &unk_1E9F4D7E0;
  v14 = v8;
  v12 = v5;
  v13 = v4;
  v9 = v4;
  v10 = v5;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 6, v11);

}

- (void)didCompleteLoadingWithResponseBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v4 = a3;
  -[_IKJSInspectorSynchronousNetworkRequestRecord setResponseBodyData:](self, "setResponseBodyData:", v4);
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTimeIntervalSince1970");
  v8 = v7;

  -[_IKJSInspectorSynchronousNetworkRequestRecord urlRequest](self, "urlRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord urlResponse](self, "urlResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_IKJSInspectorSynchronousNetworkRequestRecord urlResponse](self, "urlResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  -[_IKJSInspectorSynchronousNetworkRequestRecord timingData](self, "timingData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingWithResponseBody___block_invoke;
  v18[3] = &unk_1E9F4D808;
  v19 = v9;
  v20 = v11;
  v21 = v4;
  v22 = v12;
  v23 = v5;
  v24 = v8;
  v13 = v5;
  v14 = v12;
  v15 = v4;
  v16 = v11;
  v17 = v9;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 4, v18);

}

- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBody:(id)a4 mimeType:(id)a5
{
  -[_IKJSInspectorSynchronousNetworkRequestRecord didCompleteLoadingFromCache:mimeType:withResponseBody:](self, "didCompleteLoadingFromCache:mimeType:withResponseBody:", a3, a5, a4);
}

- (void)didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_mimeType_withResponseBody___block_invoke;
  v12[3] = &unk_1E9F4D830;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  -[_IKJSInspectorSynchronousNetworkRequestRecord didCompleteLoadingFromCache:withResponseBodyBlock:](self, "didCompleteLoadingFromCache:withResponseBodyBlock:", a3, v12);

}

- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBodyBlock:(id)a4
{
  void (**v6)(id, _QWORD *);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[3];
  id location;

  v6 = (void (**)(id, _QWORD *))a4;
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTimeIntervalSince1970");
  v9 = v8;

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_withResponseBodyBlock___block_invoke;
  v10[3] = &unk_1E9F4D858;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v11[2] = v9;
  v6[2](v6, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)_didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5 timestamp:(double)a6
{
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __CFString *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  double v32;
  uint64_t v33;
  uint64_t v34;

  v9 = a5;
  v10 = (__CFString *)a4;
  -[_IKJSInspectorSynchronousNetworkRequestRecord setResponseBodyData:](self, "setResponseBodyData:", v9);
  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorSynchronousNetworkRequestRecord urlRequest](self, "urlRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IKJSInspectorSynchronousNetworkRequestRecord urlResponse](self, "urlResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "MIMEType");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("text/plain");
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  v20 = objc_msgSend(v9, "length");
  v21 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  v22 = (void *)MEMORY[0x1E0DD9670];
  v23 = objc_alloc_init(MEMORY[0x1E0DD9648]);
  if (v10)
    v24 = v10;
  else
    v24 = v19;
  objc_msgSend(v22, "safe_initWithUrl:status:statusText:headers:mimeType:source:", v14, 200, CFSTR("OK"), v23, v24, objc_msgSend((id)objc_opt_class(), "_responseSourceTypeForCacheType:", a3));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __114___IKJSInspectorSynchronousNetworkRequestRecord__didCompleteLoadingFromCache_mimeType_withResponseBody_timestamp___block_invoke;
  v29[3] = &unk_1E9F4D880;
  v32 = a6;
  v30 = v11;
  v31 = v25;
  v33 = v21;
  v34 = v20;
  v26 = v25;
  v27 = v11;
  -[_IKJSInspectorSynchronousNetworkRequestRecord _dispatchEvent:block:](self, "_dispatchEvent:block:", 5, v29);

}

- (void)didCompleteLoadingFromMemoryWithRequest:(id)a3 response:(id)a4 withResponseBodyBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30[3];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD *))a5;
  -[_IKJSInspectorSynchronousNetworkRequestRecord loader](self, "loader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTimeIntervalSince1970");
  v13 = v12;

  -[_IKJSInspectorSynchronousNetworkRequestRecord identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9650]), "initWithType:", -[_IKJSInspectorSynchronousNetworkRequestRecord initiatorType](self, "initiatorType"));
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke;
  v24[3] = &unk_1E9F4D8D0;
  objc_copyWeak(v30, &location);
  v19 = v9;
  v25 = v19;
  v20 = v8;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  v30[1] = v17;
  v22 = v14;
  v28 = v22;
  v30[2] = v13;
  v23 = v18;
  v29 = v23;
  v10[2](v10, v24);

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

}

+ (int64_t)_responseSourceTypeForCacheType:(int64_t)a3
{
  if (a3 == 1)
    return 3;
  else
    return 0;
}

+ (int64_t)_protocolResourceTypeForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 11;
  else
    return qword_1D96A7AE0[a3 - 1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_IKJSInspectorNetworkLoader)loader
{
  return (_IKJSInspectorNetworkLoader *)objc_loadWeakRetained((id *)&self->_loader);
}

- (void)setLoader:(id)a3
{
  objc_storeWeak((id *)&self->_loader, a3);
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (int64_t)initiatorType
{
  return self->_initiatorType;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURLRequest)urlRequest
{
  return self->_URLRequest;
}

- (void)setURLRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURLResponse)urlResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)responseBodyData
{
  return self->_responseBodyData;
}

- (void)setResponseBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBodyData, 0);
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_destroyWeak((id *)&self->_loader);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_redirectEndTime, 0);
}

@end
