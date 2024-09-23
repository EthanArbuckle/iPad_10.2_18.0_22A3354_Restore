@implementation IDSQRProtoInfoResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoInfoResponse;
  -[IDSQRProtoInfoResponse dealloc](&v3, sel_dealloc);
}

- (BOOL)hasClientAddress
{
  return self->_clientAddress != 0;
}

- (unint64_t)activeParticipantsCount
{
  return self->_activeParticipants.count;
}

- (unint64_t)activeParticipants
{
  return self->_activeParticipants.list;
}

- (void)clearActiveParticipants
{
  PBRepeatedUInt64Clear();
}

- (void)addActiveParticipants:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)activeParticipantsAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_activeParticipants;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_activeParticipants = &self->_activeParticipants;
  count = self->_activeParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_activeParticipants->list[a3];
}

- (void)setActiveParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)activeLightweightParticipantsCount
{
  return self->_activeLightweightParticipants.count;
}

- (unint64_t)activeLightweightParticipants
{
  return self->_activeLightweightParticipants.list;
}

- (void)clearActiveLightweightParticipants
{
  PBRepeatedUInt64Clear();
}

- (void)addActiveLightweightParticipants:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)activeLightweightParticipantsAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_activeLightweightParticipants;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_activeLightweightParticipants = &self->_activeLightweightParticipants;
  count = self->_activeLightweightParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_activeLightweightParticipants->list[a3];
}

- (void)setActiveLightweightParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (unint64_t)activeVirtualParticipantsCount
{
  return self->_activeVirtualParticipants.count;
}

- (unint64_t)activeVirtualParticipants
{
  return self->_activeVirtualParticipants.list;
}

- (void)clearActiveVirtualParticipants
{
  PBRepeatedUInt64Clear();
}

- (void)addActiveVirtualParticipants:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)activeVirtualParticipantsAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_activeVirtualParticipants;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_activeVirtualParticipants = &self->_activeVirtualParticipants;
  count = self->_activeVirtualParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_activeVirtualParticipants->list[a3];
}

- (void)setActiveVirtualParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoInfoResponse;
  -[IDSQRProtoInfoResponse description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSString *clientAddress;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  clientAddress = self->_clientAddress;
  if (clientAddress)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)clientAddress, v7, CFSTR("client_address"));
  PBRepeatedUInt64NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, CFSTR("active_participants"));

  PBRepeatedUInt64NSArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, v15, CFSTR("active_lightweight_participants"));

  PBRepeatedUInt64NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, CFSTR("active_virtual_participants"));

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoInfoResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  $D9041E0417540B7714261C3B5E8BB314 *p_activeVirtualParticipants;
  unint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_clientAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_activeParticipants.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v9;
      ++v5;
    }
    while (v5 < self->_activeParticipants.count);
  }
  if (self->_activeLightweightParticipants.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_activeLightweightParticipants.count);
  }
  p_activeVirtualParticipants = &self->_activeVirtualParticipants;
  if (p_activeVirtualParticipants->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v9;
      ++v8;
    }
    while (v8 < p_activeVirtualParticipants->count);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  double v5;
  NSString *clientAddress;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t active;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  const char *v43;
  double v44;
  id v45;

  v45 = a3;
  clientAddress = self->_clientAddress;
  if (clientAddress)
    objc_msgSend_setClientAddress_(v45, v4, (uint64_t)clientAddress, v5);
  if (objc_msgSend_activeParticipantsCount(self, v4, (uint64_t)clientAddress, v5))
  {
    objc_msgSend_clearActiveParticipants(v45, v7, v8, v9);
    active = objc_msgSend_activeParticipantsCount(self, v10, v11, v12);
    if (active)
    {
      v14 = active;
      for (i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_activeParticipantsAtIndex_(self, v7, i, v9);
        objc_msgSend_addActiveParticipants_(v45, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_activeLightweightParticipantsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearActiveLightweightParticipants(v45, v19, v20, v21);
    v25 = objc_msgSend_activeLightweightParticipantsCount(self, v22, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        v28 = objc_msgSend_activeLightweightParticipantsAtIndex_(self, v19, j, v21);
        objc_msgSend_addActiveLightweightParticipants_(v45, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_activeVirtualParticipantsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearActiveVirtualParticipants(v45, v31, v32, v33);
    v37 = objc_msgSend_activeVirtualParticipantsCount(self, v34, v35, v36);
    if (v37)
    {
      v40 = v37;
      for (k = 0; k != v40; ++k)
      {
        v42 = objc_msgSend_activeVirtualParticipantsAtIndex_(self, v38, k, v39);
        objc_msgSend_addActiveVirtualParticipants_(v45, v43, v42, v44);
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_clientAddress, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[10];
  v12[10] = v15;

  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *clientAddress;
  uint64_t v11;
  char IsEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((clientAddress = self->_clientAddress, v11 = v4[10], !((unint64_t)clientAddress | v11))
     || objc_msgSend_isEqual_(clientAddress, v8, v11, v9))
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual())
  {
    IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_clientAddress, a2, v2, v3);
  v5 = PBRepeatedUInt64Hash();
  v6 = v5 ^ PBRepeatedUInt64Hash();
  return v6 ^ PBRepeatedUInt64Hash() ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t active;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  const char *v32;
  double v33;
  _QWORD *v34;

  v4 = a3;
  v7 = v4[10];
  v34 = v4;
  if (v7)
  {
    objc_msgSend_setClientAddress_(self, v5, v7, v6);
    v4 = v34;
  }
  active = objc_msgSend_activeParticipantsCount(v4, v5, v7, v6);
  if (active)
  {
    v12 = active;
    for (i = 0; i != v12; ++i)
    {
      v14 = objc_msgSend_activeParticipantsAtIndex_(v34, v9, i, v11);
      objc_msgSend_addActiveParticipants_(self, v15, v14, v16);
    }
  }
  v17 = objc_msgSend_activeLightweightParticipantsCount(v34, v9, v10, v11);
  if (v17)
  {
    v21 = v17;
    for (j = 0; j != v21; ++j)
    {
      v23 = objc_msgSend_activeLightweightParticipantsAtIndex_(v34, v18, j, v20);
      objc_msgSend_addActiveLightweightParticipants_(self, v24, v23, v25);
    }
  }
  v26 = objc_msgSend_activeVirtualParticipantsCount(v34, v18, v19, v20);
  if (v26)
  {
    v29 = v26;
    for (k = 0; k != v29; ++k)
    {
      v31 = objc_msgSend_activeVirtualParticipantsAtIndex_(v34, v27, k, v28);
      objc_msgSend_addActiveVirtualParticipants_(self, v32, v31, v33);
    }
  }

}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_clientAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAddress, 0);
}

@end
