@implementation BKSDisplayArrangementItem

- (BKSDisplayArrangementItem)initWithDisplayUUID:(id)a3 relativeToDisplayUUID:(id)a4 alongEdge:(unsigned int)a5 atOffset:(double)a6
{
  id v10;
  id v11;
  BKSDisplayArrangementItem *v12;
  uint64_t v13;
  NSString *displayUUID;
  uint64_t v15;
  NSString *relativeDisplayUUID;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKSDisplayArrangementItem;
  v12 = -[BKSDisplayArrangementItem init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    displayUUID = v12->_displayUUID;
    v12->_displayUUID = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    relativeDisplayUUID = v12->_relativeDisplayUUID;
    v12->_relativeDisplayUUID = (NSString *)v15;

    v12->_edge = a5;
    v12->_offset = a6;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_displayUUID);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_relativeDisplayUUID);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_edge);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_offset);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *displayUUID;
  uint64_t v7;
  id v8;
  id v9;
  NSString *relativeDisplayUUID;
  id v11;
  id v12;
  uint64_t edge;
  id v14;
  id v15;
  double offset;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  displayUUID = self->_displayUUID;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke;
  v29[3] = &unk_1E1EA0C98;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", displayUUID, v29);
  relativeDisplayUUID = self->_relativeDisplayUUID;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke_2;
  v27[3] = &unk_1E1EA0C98;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", relativeDisplayUUID, v27);
  edge = self->_edge;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke_3;
  v25[3] = &unk_1E1E9FD98;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", edge, v25);
  offset = self->_offset;
  v20 = v7;
  v21 = 3221225472;
  v22 = __37__BKSDisplayArrangementItem_isEqual___block_invoke_4;
  v23 = &unk_1E1E9FDC0;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", &v20, offset);
  LOBYTE(v14) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return (char)v14;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "appendString:withName:", self->_displayUUID, CFSTR("displayUUID"));
  objc_msgSend(v6, "appendString:withName:skipIfEmpty:", self->_relativeDisplayUUID, CFSTR("relativeDisplayUUID"), 1);
  v4 = (id)objc_msgSend(v6, "appendUnsignedInteger:withName:", self->_edge, CFSTR("edge"));
  v5 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("offset"), self->_offset);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayUUID;
  void *v5;
  id v6;

  displayUUID = self->_displayUUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", displayUUID, CFSTR("displayUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_relativeDisplayUUID, CFSTR("relativeDisplayUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_edge);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("edge"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("offset"), self->_offset);
}

- (BKSDisplayArrangementItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  BKSDisplayArrangementItem *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relativeDisplayUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edge"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offset"));
  v10 = v9;

  v11 = -[BKSDisplayArrangementItem initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:](self, "initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:", v5, v6, v8, v10);
  return v11;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (NSString)relativeDisplayUUID
{
  return self->_relativeDisplayUUID;
}

- (unsigned)edge
{
  return self->_edge;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayUUID");
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relativeDisplayUUID");
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "edge");
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "offset");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
