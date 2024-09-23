@implementation MFContentErrorDocument

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFContentErrorDocument;
  -[MFContentErrorDocument dealloc](&v3, sel_dealloc);
}

- (MFContentErrorDocument)initWithMimePart:(id)a3
{
  MFContentErrorDocument *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFContentErrorDocument.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mimePart"));
  v9.receiver = self;
  v9.super_class = (Class)MFContentErrorDocument;
  v5 = -[MFContentErrorDocument init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CANNOT_DECODE_MULTIPART_MESSAGE"), (uint64_t)CFSTR("This message cannot be displayed because of the way it is formatted. Ask the sender to send it again using a different format or email program.\n\n%@/%@"), CFSTR("Delayed")), objc_msgSend(a3, "type"), objc_msgSend(a3, "subtype"));
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5->_error = (NSError *)(id)objc_msgSend(MEMORY[0x1E0CB35C8], "mf_decodeFailedErrorWithUserInfo:", v7);
  }
  return v5;
}

- (NSString)content
{
  return -[NSError localizedDescription](-[MFContentErrorDocument error](self, "error"), "localizedDescription");
}

- (NSError)error
{
  return self->_error;
}

@end
