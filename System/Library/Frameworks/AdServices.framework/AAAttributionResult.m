@implementation AAAttributionResult

- (AAAttributionResult)initWithToken:(id)a3 source:(int64_t)a4
{
  return (AAAttributionResult *)MEMORY[0x24BEDD108](self, sel_initWithToken_success_error_source_, a3, 1, 0, a4);
}

- (AAAttributionResult)initWithError:(id)a3
{
  return (AAAttributionResult *)MEMORY[0x24BEDD108](self, sel_initWithToken_success_error_source_, 0, 0, a3, 0);
}

- (AAAttributionResult)initWithToken:(id)a3 success:(BOOL)a4 error:(id)a5 source:(int64_t)a6
{
  id v11;
  id v12;
  AAAttributionResult *v13;
  AAAttributionResult *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AAAttributionResult;
  v13 = -[AAAttributionResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_token, a3);
    v14->_success = a4;
    objc_storeStrong((id *)&v14->_error, a5);
    v14->_source = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;

  v58 = a3;
  objc_msgSend_token(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v58, v10, (uint64_t)v9, (uint64_t)CFSTR("token"), v11, v12);

  v18 = objc_msgSend_success(self, v13, v14, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v58, v19, v18, (uint64_t)CFSTR("success"), v20, v21);
  objc_msgSend_error(self, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v58, v28, (uint64_t)v27, (uint64_t)CFSTR("error"), v29, v30);

  objc_msgSend_storeFront(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v58, v37, (uint64_t)v36, (uint64_t)CFSTR("storeFront"), v38, v39);

  objc_msgSend_daemonRunningTime(self, v40, v41, v42, v43, v44);
  objc_msgSend_encodeDouble_forKey_(v58, v45, (uint64_t)CFSTR("daemonRunningTime"), v46, v47, v48);
  v54 = objc_msgSend_source(self, v49, v50, v51, v52, v53);
  objc_msgSend_encodeInteger_forKey_(v58, v55, v54, (uint64_t)CFSTR("source"), v56, v57);

}

- (AAAttributionResult)initWithCoder:(id)a3
{
  id v4;
  AAAttributionResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *token;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSError *error;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *storeFront;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AAAttributionResult;
  v5 = -[AAAttributionResult init](&v38, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("token"), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v10;

    v5->_success = objc_msgSend_decodeBoolForKey_(v4, v12, (uint64_t)CFSTR("success"), v13, v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("error"), v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("storeFront"), v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSString *)v26;

    objc_msgSend_decodeDoubleForKey_(v4, v28, (uint64_t)CFSTR("daemonRunningTime"), v29, v30, v31);
    v5->_daemonRunningTime = v32;
    v5->_source = objc_msgSend_decodeIntegerForKey_(v4, v33, (uint64_t)CFSTR("source"), v34, v35, v36);
  }

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)source
{
  return self->_source;
}

- (double)daemonRunningTime
{
  return self->_daemonRunningTime;
}

- (void)setDaemonRunningTime:(double)a3
{
  self->_daemonRunningTime = a3;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_storeStrong((id *)&self->_storeFront, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
