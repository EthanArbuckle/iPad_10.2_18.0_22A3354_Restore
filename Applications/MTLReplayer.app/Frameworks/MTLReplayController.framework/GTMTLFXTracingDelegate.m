@implementation GTMTLFXTracingDelegate

- (GTMTLFXTracingDelegate)init
{
  uint64_t v2;
  GTMTLFXTracingDelegate *v3;
  uint64_t v4;
  NSMutableDictionary *mtlfxTracingDictionary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTMTLFXTracingDelegate;
  v3 = -[GTMTLFXTracingDelegate init](&v7, "init");
  if (v3)
  {
    v4 = objc_opt_new(NSMutableDictionary, v2);
    mtlfxTracingDictionary = v3->_mtlfxTracingDictionary;
    v3->_mtlfxTracingDictionary = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (NSData)mtlfxTracingInfo
{
  NSMutableDictionary *mtlfxTracingDictionary;
  uint64_t v4;

  mtlfxTracingDictionary = self->_mtlfxTracingDictionary;
  v4 = 0;
  return (NSData *)(id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", mtlfxTracingDictionary, 1, &v4));
}

- (void)_addEncoderInfo:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *mtlfxTracingDictionary;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  mtlfxTracingDictionary = self->_mtlfxTracingDictionary;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->functionIndex));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](mtlfxTracingDictionary, "objectForKeyedSubscript:", v6));

  v8 = v13;
  if (!v13)
  {
    v9 = objc_opt_new(NSMutableArray, v7);
    v10 = self->_mtlfxTracingDictionary;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->functionIndex));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

    v8 = (id)v9;
  }
  v14 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_msgSend(v14, "addObject:", v12);

}

- (void)scaler:(id)a3 didCreateRenderCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6;

  v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", objc_msgSend(v6, "globalTraceObjectID"));

}

- (void)scaler:(id)a3 didCreateBlitCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6;

  v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", objc_msgSend(v6, "globalTraceObjectID"));

}

- (void)scaler:(id)a3 didCreateComputeCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6;

  v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", objc_msgSend(v6, "globalTraceObjectID"));

}

- (unint64_t)functionIndex
{
  return self->functionIndex;
}

- (void)setFunctionIndex:(unint64_t)a3
{
  self->functionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlfxTracingDictionary, 0);
}

@end
