@implementation _NNLayerInfo

- (_NNLayerInfo)initWithType:(id)a3 concatenatedInputNames:(id)a4 bidirectional:(BOOL)a5
{
  id v9;
  id v10;
  _NNLayerInfo *v11;
  _NNLayerInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NNLayerInfo;
  v11 = -[_NNLayerInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    objc_storeStrong((id *)&v12->_concatenatedInputNames, a4);
    v12->_bidirectional = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concatenatedInputNames, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)bidirectional
{
  return self->_bidirectional;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)concatenatedInputNames
{
  return self->_concatenatedInputNames;
}

@end
