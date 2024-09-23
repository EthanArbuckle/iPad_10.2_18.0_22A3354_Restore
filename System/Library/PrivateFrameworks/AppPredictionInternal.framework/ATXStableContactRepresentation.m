@implementation ATXStableContactRepresentation

- (ATXStableContactRepresentation)initWithStableContactIdentifier:(id)a3 cnContactId:(id)a4 rawIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXStableContactRepresentation *v11;
  uint64_t v12;
  NSString *stableContactIdentifier;
  uint64_t v14;
  NSString *cnContactId;
  uint64_t v16;
  NSString *rawIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXStableContactRepresentation;
  v11 = -[ATXStableContactRepresentation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    stableContactIdentifier = v11->_stableContactIdentifier;
    v11->_stableContactIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    cnContactId = v11->_cnContactId;
    v11->_cnContactId = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    rawIdentifier = v11->_rawIdentifier;
    v11->_rawIdentifier = (NSString *)v16;

  }
  return v11;
}

- (NSString)stableContactIdentifier
{
  return self->_stableContactIdentifier;
}

- (NSString)cnContactId
{
  return self->_cnContactId;
}

- (NSString)rawIdentifier
{
  return self->_rawIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactId, 0);
  objc_storeStrong((id *)&self->_stableContactIdentifier, 0);
}

@end
