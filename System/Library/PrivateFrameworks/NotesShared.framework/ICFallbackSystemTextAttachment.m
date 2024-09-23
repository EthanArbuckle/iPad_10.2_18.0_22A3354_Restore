@implementation ICFallbackSystemTextAttachment

- (ICFallbackSystemTextAttachment)initWithData:(id)a3 type:(id)a4 contentIdentifier:(id)a5 systemClassName:(id)a6
{
  id v11;
  id v12;
  ICFallbackSystemTextAttachment *v13;
  ICFallbackSystemTextAttachment *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ICFallbackSystemTextAttachment;
  v13 = -[ICFallbackSystemTextAttachment initWithData:ofType:](&v16, sel_initWithData_ofType_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentIdentifier, a5);
    objc_storeStrong((id *)&v14->_systemClassName, a6);
  }

  return v14;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)systemClassName
{
  return self->_systemClassName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemClassName, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

@end
