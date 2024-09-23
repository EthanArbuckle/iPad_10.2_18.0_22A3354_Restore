@implementation GDContact

- (GDContact)initWithHandle:(id)a3
{
  return (GDContact *)objc_msgSend_initWithHandle_contactType_displayName_participantStatus_(self, a2, (uint64_t)a3, 0, 0, 0);
}

- (GDContact)initWithHandle:(id)a3 contactType:(int64_t)a4 displayName:(id)a5 participantStatus:(int64_t)a6
{
  id v11;
  id v12;
  GDContact *v13;
  GDContact *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GDContact;
  v13 = -[GDContact init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_handle, a3);
    objc_storeStrong((id *)&v14->_displayName, a5);
    v14->_contactType = a4;
    v14->_participantStatus = a6;
  }

  return v14;
}

- (NSString)handle
{
  return self->_handle;
}

- (int64_t)contactType
{
  return self->_contactType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
