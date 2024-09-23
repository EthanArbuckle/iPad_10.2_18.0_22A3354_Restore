@implementation _FBSSnapshotLayer

- (_FBSSnapshotLayer)initWithContextID:(unsigned int)a3 baseTransform:(CATransform3D *)a4
{
  _FBSSnapshotLayer *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_FBSSnapshotLayer;
  result = -[_FBSSnapshotLayer init](&v13, sel_init);
  if (result)
  {
    result->_contextID = a3;
    v7 = *(_OWORD *)&a4->m11;
    v8 = *(_OWORD *)&a4->m13;
    v9 = *(_OWORD *)&a4->m23;
    *(_OWORD *)&result->_baseTransform.m21 = *(_OWORD *)&a4->m21;
    *(_OWORD *)&result->_baseTransform.m23 = v9;
    *(_OWORD *)&result->_baseTransform.m11 = v7;
    *(_OWORD *)&result->_baseTransform.m13 = v8;
    v10 = *(_OWORD *)&a4->m31;
    v11 = *(_OWORD *)&a4->m33;
    v12 = *(_OWORD *)&a4->m43;
    *(_OWORD *)&result->_baseTransform.m41 = *(_OWORD *)&a4->m41;
    *(_OWORD *)&result->_baseTransform.m43 = v12;
    *(_OWORD *)&result->_baseTransform.m31 = v10;
    *(_OWORD *)&result->_baseTransform.m33 = v11;
  }
  return result;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (CATransform3D)baseTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m13;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

@end
