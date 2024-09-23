@implementation _NUBufferImage

- (id)debugQuickLookObject
{
  return +[NUImageFactory newCIImageFromBufferImage:](NUImageFactory, "newCIImageFromBufferImage:", self);
}

- (void)readBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45___NUBufferImage_readBufferRegion_withBlock___block_invoke;
  v8[3] = &unk_1E50638E0;
  v9 = v6;
  v7 = v6;
  -[_NUImage readRegion:withBlock:](self, "readRegion:withBlock:", a3, v8);

}

- (void)writeBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke;
  v8[3] = &unk_1E50638E0;
  v9 = v6;
  v7 = v6;
  -[_NUImage writeRegion:withBlock:](self, "writeRegion:withBlock:", a3, v8);

}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v8[2];

  var1 = a4->var1;
  v8[0] = a4->var0;
  v8[1] = var1;
  return -[_NUBufferImage copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", a3, v8, a5.var0, a5.var1, a6);
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  void *v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  uint64_t v13;
  _QWORD v15[7];
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  _OWORD v18[2];

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v10 = a4->var1;
  v18[0] = a4->var0;
  v18[1] = v10;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = 3221225472;
  v12 = a4->var1;
  v16 = a4->var0;
  v17 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __53___NUBufferImage_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5063930;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  v13 = objc_msgSend(v9, "readBufferInRegion:block:", v11, v15);

  return v13 == 1;
}

@end
