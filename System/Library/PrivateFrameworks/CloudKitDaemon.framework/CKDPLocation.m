@implementation CKDPLocation

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPLocation;
  -[CKDPLocation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPLocationCoordinate *coordinate;
  void *v8;
  const char *v9;
  CKDPLocationBound *bounds;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  coordinate = self->_coordinate;
  if (coordinate)
  {
    objc_msgSend_dictionaryRepresentation(coordinate, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("coordinate"));

  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_dictionaryRepresentation(bounds, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("bounds"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  CKDPLocationBound *v18;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        return *((_BYTE *)a3 + *v6) == 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        if (v10++ >= 9)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        return *((_BYTE *)a3 + *v6) == 0;
      if ((v11 >> 3) == 2)
        break;
      if ((v11 >> 3) == 1)
      {
        v18 = (CKDPLocationBound *)objc_alloc_init(MEMORY[0x1E0C94C78]);
        objc_storeStrong((id *)&self->_coordinate, v18);
        if (!PBReaderPlaceMark() || (CKDPLocationCoordinateReadFrom() & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        return *((_BYTE *)a3 + *v6) == 0;
    }
    v18 = objc_alloc_init(CKDPLocationBound);
    objc_storeStrong((id *)&self->_bounds, v18);
    if (!PBReaderPlaceMark() || (sub_1BEB58614((uint64_t)v18, (uint64_t)a3) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bounds)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPLocationCoordinate *coordinate;
  CKDPLocationBound *bounds;
  id v8;

  v4 = a3;
  coordinate = self->_coordinate;
  v8 = v4;
  if (coordinate)
  {
    objc_msgSend_setCoordinate_(v4, v5, (uint64_t)coordinate);
    v4 = v8;
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_setBounds_(v8, v5, (uint64_t)bounds);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_coordinate, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_bounds, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPLocationCoordinate *coordinate;
  uint64_t v9;
  CKDPLocationBound *bounds;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((coordinate = self->_coordinate, v9 = v4[2], !((unint64_t)coordinate | v9))
     || objc_msgSend_isEqual_(coordinate, v7, v9)))
  {
    bounds = self->_bounds;
    v11 = v4[1];
    if ((unint64_t)bounds | v11)
      isEqual = objc_msgSend_isEqual_(bounds, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_coordinate, a2, v2);
  return objc_msgSend_hash(self->_bounds, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPLocationCoordinate *coordinate;
  uint64_t v6;
  CKDPLocationBound *bounds;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  coordinate = self->_coordinate;
  v6 = v4[2];
  v9 = v4;
  if (coordinate)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(coordinate, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setCoordinate_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  bounds = self->_bounds;
  v8 = v4[1];
  if (bounds)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(bounds, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setBounds_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (CKDPLocationBound)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
