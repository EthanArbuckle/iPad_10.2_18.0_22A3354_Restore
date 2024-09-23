@implementation NSRelationshipStoreMapping

- (void)dealloc
{
  objc_super v3;

  -[NSRelationshipStoreMapping setDestinationEntityExternalName:]((uint64_t)self, 0);
  -[NSRelationshipStoreMapping setForeignKeys:]((uint64_t)self, 0);
  -[NSRelationshipStoreMapping setJoins:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipStoreMapping;
  -[NSPropertyStoreMapping dealloc](&v3, sel_dealloc);
}

- (uint64_t)setDestinationEntityExternalName:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 24);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 24) = result;
    }
  }
  return result;
}

- (uint64_t)setForeignKeys:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 32);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 32) = result;
    }
  }
  return result;
}

- (uint64_t)setJoins:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 40);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 40) = result;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSRelationshipStoreMapping;
  v5 = -[NSPropertyStoreMapping isEqual:](&v11, sel_isEqual_);
  if (v5)
  {
    v6 = -[NSRelationshipStoreMapping destinationEntityExternalName](self, "destinationEntityExternalName");
    if (v6 == (id)objc_msgSend(a3, "destinationEntityExternalName")
      || (v5 = objc_msgSend(-[NSRelationshipStoreMapping destinationEntityExternalName](self, "destinationEntityExternalName"), "isEqual:", objc_msgSend(a3, "destinationEntityExternalName"))) != 0)
    {
      v7 = -[NSRelationshipStoreMapping foreignKeys](self, "foreignKeys");
      if (v7 == (id)objc_msgSend(a3, "foreignKeys")
        || (v5 = objc_msgSend(-[NSRelationshipStoreMapping foreignKeys](self, "foreignKeys"), "isEqual:", objc_msgSend(a3, "foreignKeys"))) != 0)
      {
        v8 = -[NSRelationshipStoreMapping joins](self, "joins");
        if (v8 == (id)objc_msgSend(a3, "joins")
          || (v5 = objc_msgSend(-[NSRelationshipStoreMapping joins](self, "joins"), "isEqual:", objc_msgSend(a3, "joins"))) != 0)
        {
          v9 = -[NSRelationshipStoreMapping joinSemantic](self, "joinSemantic");
          LOBYTE(v5) = v9 == objc_msgSend(a3, "joinSemantic");
        }
      }
    }
  }
  return v5;
}

- (id)destinationEntityExternalName
{
  return self->_destinationEntityExternalName;
}

- (id)foreignKeys
{
  return self->_foreignKeys;
}

- (id)joins
{
  return self->_joins;
}

- (unsigned)joinSemantic
{
  return self->_joinSemantic;
}

@end
