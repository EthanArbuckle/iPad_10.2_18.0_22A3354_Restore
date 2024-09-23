@implementation MFAttachmentPlaceholder

+ (id)placeholder
{
  return objc_alloc_init((Class)a1);
}

- (MFAttachmentPlaceholder)init
{
  MFAttachmentPlaceholder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFAttachmentPlaceholder;
  v2 = -[MFAttachmentPlaceholder init](&v4, sel_init);
  if (v2)
    v2->_jsonDictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentPlaceholder;
  -[MFAttachmentPlaceholder dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  const char *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MFAttachmentPlaceholder fileName](self, "fileName");
  v5 = -[MFAttachmentPlaceholder fileSize](self, "fileSize");
  v6 = -[MFAttachmentPlaceholder mimeType](self, "mimeType");
  v7 = -[MFAttachmentPlaceholder fileURLString](self, "fileURLString");
  v8 = -[MFAttachmentPlaceholder contentID](self, "contentID");
  v9 = -[MFAttachmentPlaceholder useMailDrop](self, "useMailDrop");
  v10 = "SMTP";
  if (v9)
    v10 = "MailDrop";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %lu [%@] @ %@ : %@ [%s]"), v4, v5, v6, v7, v8, v10);
}

- (void)_setJSONDictionary:(id)a3
{

  self->_jsonDictionary = (NSMutableDictionary *)a3;
}

- (id)fileName
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileName"));
}

- (void)setFileName:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("fileName"));
}

- (unint64_t)fileSize
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileSize")), "unsignedIntegerValue");
}

- (void)setFileSize:(unint64_t)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("fileSize"));
}

- (id)mimeType
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("mimeType"));
}

- (void)setMimeType:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("mimeType"));
}

- (id)fileURLString
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileURL"));
}

- (void)setFileURLString:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("fileURL"));
}

- (id)fileURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", -[MFAttachmentPlaceholder fileURLString](self, "fileURLString"));
}

- (id)contentID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("contentID"));
}

- (void)setContentID:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("contentID"));
}

- (BOOL)useMailDrop
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("mailDrop")), "BOOLValue");
}

- (void)setUseMailDrop:(BOOL)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("mailDrop"));
}

+ (id)placeholderFromSerializedRepresentation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  if (!objc_msgSend(a1, "isPlaceholderSerializedRepresentation:"))
    return 0;
  v4 = objc_msgSend(a3, "subdataWithRange:", 4, objc_msgSend(a3, "length") - 4);
  if (!v4)
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  v18 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v18);
  v6 = 0;
  if (!v18)
  {
    v7 = (void *)v5;
    if (v5)
    {
      v6 = +[MFAttachmentPlaceholder placeholder](MFAttachmentPlaceholder, "placeholder");
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v6, "_setJSONDictionary:", v8);

    }
  }
  return v6;
}

+ (id)_placeholderMagic
{
  if (_placeholderMagic_onceToken != -1)
    dispatch_once(&_placeholderMagic_onceToken, &__block_literal_global_11);
  return (id)_placeholderMagic_placeholderMagic;
}

id __44__MFAttachmentPlaceholder__placeholderMagic__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &MFAttachmentPlaceholderMagic, 4);
  _placeholderMagic_placeholderMagic = (uint64_t)result;
  return result;
}

+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") >= 0x35
      && (unint64_t)objc_msgSend(a3, "length") <= 0x833
      && objc_msgSend(a3, "rangeOfData:options:range:", objc_msgSend(a1, "_placeholderMagic"), 2, 0, 4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)serializedRepresentation
{
  NSMutableDictionary *jsonDictionary;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  jsonDictionary = self->_jsonDictionary;
  if (!jsonDictionary)
    return 0;
  v15 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", jsonDictionary, 0, &v15);
  if (!v3)
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MFAttachmentPlaceholder serializedRepresentation].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &MFAttachmentPlaceholderMagic, 4);
  objc_msgSend(v5, "appendData:", v4);
  return v5;
}

+ (id)dataForPlaceholder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id result;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)objc_msgSend(a3, "fileURL");
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))
  {
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MFAttachmentPlaceholder dataForPlaceholder:].cold.2((uint64_t)v3, v6);
    return 0;
  }
  if (MFIsMobileMail())
  {
    v4 = +[MFAttachmentSecurityScope securityScopedURL:withToken:](MFAttachmentSecurityScope, "securityScopedURL:withToken:", v3, 0);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v4);
  }
  else
  {
    v5 = 0;
  }
  result = (id)objc_msgSend((id)objc_msgSend(v5, "result:", 0), "data");
  if (!result)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MFAttachmentPlaceholder dataForPlaceholder:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    return 0;
  }
  return result;
}

+ (void)placeholderFromSerializedRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1C8839000, a1, a3, "#Attachments Failed to deserialize placeholder", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)serializedRepresentation
{
  OUTLINED_FUNCTION_0_4(&dword_1C8839000, a1, a3, "#Attachments Failed to serialize placeholder", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

+ (void)dataForPlaceholder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1C8839000, a1, a3, "#Attachments Failed obtain data for temporary file", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

+ (void)dataForPlaceholder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C8839000, a2, OS_LOG_TYPE_ERROR, "#Attachments Attempted to resolve placeholder for non-existant file: %@", (uint8_t *)&v2, 0xCu);
}

@end
