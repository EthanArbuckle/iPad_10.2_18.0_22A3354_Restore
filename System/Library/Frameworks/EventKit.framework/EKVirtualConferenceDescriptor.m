@implementation EKVirtualConferenceDescriptor

- (EKVirtualConferenceDescriptor)initWithTitle:(NSString *)title URLDescriptors:(NSArray *)URLDescriptors conferenceDetails:(NSString *)conferenceDetails
{
  NSString *v9;
  NSArray *v10;
  NSString *v11;
  EKVirtualConferenceDescriptor *v12;
  objc_super v14;

  v9 = title;
  v10 = URLDescriptors;
  v11 = conferenceDetails;
  v14.receiver = self;
  v14.super_class = (Class)EKVirtualConferenceDescriptor;
  v12 = -[EKVirtualConferenceDescriptor init](&v14, sel_init);
  if (v12)
  {
    if (!-[NSArray count](v10, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No URLs provided"));
    objc_storeStrong((id *)&v12->_title, title);
    objc_storeStrong((id *)&v12->_URLDescriptors, URLDescriptors);
    objc_storeStrong((id *)&v12->_conferenceDetails, conferenceDetails);
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)URLDescriptors
{
  return self->_URLDescriptors;
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_URLDescriptors, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
