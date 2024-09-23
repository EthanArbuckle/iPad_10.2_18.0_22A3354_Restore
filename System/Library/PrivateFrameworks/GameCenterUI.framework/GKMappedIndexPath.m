@implementation GKMappedIndexPath

+ (id)indexPathForItem:(int64_t)a3 inSection:(int64_t)a4 fromSourceIndexPath:(id)a5 withTag:(id)a6
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = a4;
  v12[1] = a3;
  v8 = a6;
  v9 = a5;
  objc_msgSend(a1, "indexPathWithIndexes:length:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTag:", v8);

  objc_msgSend(v10, "setSourceIndexPath:", v9);
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> [%d, %d] => %@:[%d, %d]"), objc_opt_class(), self, -[NSIndexPath section](self->_sourceIndexPath, "section"), -[NSIndexPath item](self->_sourceIndexPath, "item"), self->_tag, -[GKMappedIndexPath section](self, "section"), -[GKMappedIndexPath item](self, "item"));
}

- (id)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong(&self->_tag, a3);
}

- (NSIndexPath)sourceIndexPath
{
  return self->_sourceIndexPath;
}

- (void)setSourceIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIndexPath, 0);
  objc_storeStrong(&self->_tag, 0);
}

@end
