@implementation MTLFunctionStitchingFunctionNodeSPI

- (MTLFunctionStitchingFunctionNodeSPI)initWithName:(id)a3 arguments:(id)a4 controlDependencies:(id)a5 isEarlyReturn:(BOOL)a6
{
  MTLFunctionStitchingFunctionNodeSPI *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  result = -[MTLFunctionStitchingFunctionNode initWithName:arguments:controlDependencies:](&v8, sel_initWithName_arguments_controlDependencies_, a3, a4, a5);
  result->_isEarlyReturn = a6;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  v4 = -[MTLFunctionStitchingFunctionNode copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIsEarlyReturn:", self->_isEarlyReturn);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *Class;
  unsigned int v8;
  BOOL v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v11.receiver = self;
      v11.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
      v8 = -[MTLFunctionStitchingFunctionNode isEqual:](&v11, sel_isEqual_, a3);
      if (v8)
      {
        v9 = -[MTLFunctionStitchingFunctionNodeSPI isEarlyReturn](self, "isEarlyReturn");
        LOBYTE(v8) = v9 ^ objc_msgSend(a3, "isEarlyReturn") ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  id v3;
  _BOOL8 isEarlyReturn;
  objc_super v6;
  _QWORD v7[2];

  bzero(v7, 0x10uLL);
  v6.receiver = self;
  v6.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  v3 = -[MTLFunctionStitchingFunctionNode hash](&v6, sel_hash);
  isEarlyReturn = self->_isEarlyReturn;
  v7[0] = v3;
  v7[1] = isEarlyReturn;
  return _MTLHashState((int *)v7, 0x10uLL);
}

- (BOOL)isEarlyReturn
{
  return self->_isEarlyReturn;
}

- (void)setIsEarlyReturn:(BOOL)a3
{
  self->_isEarlyReturn = a3;
}

@end
