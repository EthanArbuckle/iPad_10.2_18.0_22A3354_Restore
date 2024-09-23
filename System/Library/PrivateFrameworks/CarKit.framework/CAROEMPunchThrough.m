@implementation CAROEMPunchThrough

- (CAROEMPunchThrough)initWithDictionary:(id)a3
{
  id v4;
  CAROEMPunchThrough *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSString *identifier;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  CAROEMPunchThrough *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CAROEMPunchThrough;
  v5 = -[CAROEMPunchThrough init](&v36, sel_init);
  if (!v5)
    goto LABEL_21;
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("inputStreamUID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
  {
    CarGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAROEMPunchThrough initWithDictionary:].cold.1((uint64_t)v4, v7, v14, v15, v16, v17, v18, v19);
    goto LABEL_28;
  }
  v8 = -[NSObject copy](v7, "copy");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("viewArea"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11)
  {
    CarGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAROEMPunchThrough initWithDictionary:].cold.2((uint64_t)v4, v11, v22, v23, v24, v25, v26, v27);
    goto LABEL_27;
  }
  CRSizeFromAirPlayDictionary(v11, &v5->_size.width);
  objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("inputStreamType"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v20 = objc_msgSend(v13, "unsignedIntValue");
  if (!v13 || v20 >= 4)
  {
    CarGeneralLogging();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CAROEMPunchThrough initWithDictionary:].cold.3((uint64_t)v4, v28, v29, v30, v31, v32, v33, v34);

LABEL_27:
LABEL_28:

    v21 = 0;
    goto LABEL_29;
  }
  v5->_type = v20;

LABEL_21:
  v21 = v5;
LABEL_29:

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "Unable to parse punch through identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "Unable to parse punch through size: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "Unable to parse punch through type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
