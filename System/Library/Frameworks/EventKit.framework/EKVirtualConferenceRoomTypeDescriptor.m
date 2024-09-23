@implementation EKVirtualConferenceRoomTypeDescriptor

- (EKVirtualConferenceRoomTypeDescriptor)initWithTitle:(NSString *)title identifier:(EKVirtualConferenceRoomTypeIdentifier)identifier
{
  NSString *v7;
  NSString *v8;
  EKVirtualConferenceRoomTypeDescriptor *v9;
  objc_super v11;

  v7 = title;
  v8 = identifier;
  v11.receiver = self;
  v11.super_class = (Class)EKVirtualConferenceRoomTypeDescriptor;
  v9 = -[EKVirtualConferenceRoomTypeDescriptor init](&v11, sel_init);
  if (v9)
  {
    if (!-[NSString length](v7, "length"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("title is empty"));
    if (!-[NSString length](v8, "length"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("identifier is empty"));
    objc_storeStrong((id *)&v9->_title, title);
    objc_storeStrong((id *)&v9->_identifier, identifier);
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (EKVirtualConferenceRoomTypeIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
