@implementation EKSerializableAttachment

+ (id)classesForKey
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (EKSerializableAttachment)initWithAttachment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKSerializableAttachment;
  return -[EKSerializableAttachment init](&v4, sel_init, a3);
}

- (id)createAttachment
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Method not implemented on iOS."));
  return 0;
}

- (NSURL)urlOnDisk
{
  return self->_urlOnDisk;
}

- (void)setUrlOnDisk:(id)a3
{
  objc_storeStrong((id *)&self->_urlOnDisk, a3);
}

- (NSString)contentTypeFromServer
{
  return self->_contentTypeFromServer;
}

- (void)setContentTypeFromServer:(id)a3
{
  objc_storeStrong((id *)&self->_contentTypeFromServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeFromServer, 0);
  objc_storeStrong((id *)&self->_urlOnDisk, 0);
}

@end
