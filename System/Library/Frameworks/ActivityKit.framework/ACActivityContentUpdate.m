@implementation ACActivityContentUpdate

- (ACActivityContentUpdate)initWithIdentifier:(id)a3 descriptor:(id)a4 state:(int64_t)a5 content:(id)a6
{
  id v10;
  id v11;
  id v12;
  ACActivityContentUpdate *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  ACActivityDescriptor *descriptor;
  uint64_t v18;
  ACActivityContent *content;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ACActivityContentUpdate;
  v13 = -[ACActivityContentUpdate init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    descriptor = v13->_descriptor;
    v13->_descriptor = (ACActivityDescriptor *)v16;

    v13->_state = a5;
    v18 = objc_msgSend(v12, "copy");
    content = v13->_content;
    v13->_content = (ACActivityContent *)v18;

  }
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (ACActivityContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
