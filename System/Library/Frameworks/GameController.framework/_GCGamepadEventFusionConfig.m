@implementation _GCGamepadEventFusionConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventFusionConfig)initWithSourceCount:(unint64_t)a3
{
  _GCGamepadEventFusionConfig *v4;
  _GCGamepadEventFusionConfig *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GCGamepadEventFusionConfig;
  v4 = -[_GCGamepadEventFusionConfig init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sourceCount = a3;
    if (a3)
      v4->_matrix = (unsigned __int8 (*)[47])malloc_type_calloc(a3, 0x2FuLL, 0x10000408E6526DAuLL);
  }
  return v5;
}

- (_GCGamepadEventFusionConfig)init
{
  return -[_GCGamepadEventFusionConfig initWithSourceCount:](self, "initWithSourceCount:", 0);
}

- (_GCGamepadEventFusionConfig)initWithCoder:(id)a3
{
  id v4;
  _GCGamepadEventFusionConfig *v5;
  uint64_t v6;
  const void *v7;
  unsigned __int8 (*v8)[47];
  size_t v9;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCGamepadEventFusionConfig;
  v5 = -[_GCGamepadEventFusionConfig init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceCount"));
    v5->_sourceCount = v6;
    if (v6)
    {
      v11 = 0;
      v7 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("matrix"), &v11);
      v8 = (unsigned __int8 (*)[47])malloc_type_calloc(v5->_sourceCount, 0x2FuLL, 0x10000408E6526DAuLL);
      v5->_matrix = v8;
      if (v11 >= 47 * v5->_sourceCount)
        v9 = 47 * v5->_sourceCount;
      else
        v9 = v11;
      memcpy(v8, v7, v9);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sourceCount;
  id v5;

  sourceCount = self->_sourceCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceCount, CFSTR("sourceCount"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_matrix, 47 * self->_sourceCount, CFSTR("matrix"));

}

- (void)dealloc
{
  unsigned __int8 (*matrix)[47];
  objc_super v4;

  matrix = self->_matrix;
  if (matrix)
    free(matrix);
  v4.receiver = self;
  v4.super_class = (Class)_GCGamepadEventFusionConfig;
  -[_GCGamepadEventFusionConfig dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[6];

  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __47___GCGamepadEventFusionConfig_debugDescription__block_invoke;
  v48[3] = &unk_24D2B57F0;
  v48[4] = self;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199DEBB0](v48, a2);
  v21 = objc_opt_class();
  v2[2](v2, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 15);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 27);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p> {\n\t.DpadUp: %@\n\t.DpadDown: %@\n\t.DpadLeft: %@\n\t.DpadRight: %@\n\t.ButtonA: %@\n\t.ButtonB: %@\n\t.ButtonX: %@\n\t.ButtonY: %@\n\t.LeftShoulder: %@\n\t.RightShoulder: %@\n\t.LeftThumbstickUp: %@\n\t.LeftThumbstickDown: %@\n\t.LeftThumbstickLeft: %@\n\t.LeftThumbstickRight: %@\n\t.RightThumbstickUp: %@\n\t.RightThumbstickDown: %@\n\t.RightThumbstickLeft: %@\n\t.RightThumbstickRight: %@\n\t.LeftTrigger: %@\n\t.RightTrigger: %@\n\t.LeftThumbstickButton: %@\n\t.RightThumbstickButton: %@\n\t.ButtonHome: %@\n\t.ButtonMenu: %@\n\t.ButtonOptions: %@\n\t.ButtonSpecial0: %@\n\t.ButtonSpecial1: %@\n\t.ButtonSpecial2: %@\n\t.ButtonSpecial3: %@\n\t.ButtonSpecial4: %@\n\t.ButtonSpecial5: %@\n\t.ButtonSpecial6: %@\n\t.ButtonSpecial7: %@\n\t.ButtonSpecial8: %@\n\t.ButtonSpecial9: %@\n\t.ButtonSpecial10: %@\n\t.ButtonSpecial11: %@\n\t.ButtonSpecial12: %@\n\t.ButtonSpecial13: %@\n\t.ButtonSpecial14: %@\n\t.ButtonShare: %@\n}"), v21, self, v46, v47, v44, v45, v42, v43, v40, v41, v38, v39, v37, v36, v35, v34,
    v33,
    v32,
    v31,
    v20,
    v19,
    v30,
    v18,
    v29,
    v16,
    v28,
    v15,
    v14,
    v13,
    v27,
    v26,
    v25,
    v24,
    v23,
    v12,
    v9,
    v11,
    v10,
    v8,
    v7,
    v6,
    v3,
    v4);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setPassRule:(unsigned __int8)a3 forElement:(int64_t)a4 forSourceAtIndex:(unint64_t)a5
{
  unint64_t sourceCount;
  void *v11;
  id v12;

  sourceCount = self->_sourceCount;
  if (sourceCount <= a5)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventFusion.m"), 174, CFSTR("Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)"), a5, self->_sourceCount);

    sourceCount = self->_sourceCount;
  }
  if (sourceCount > a5)
  {
    if (a4 >= 47)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventFusion.m"), 179, CFSTR("Invalid element (%llu)"), a4);

    }
    else
    {
      self->_matrix[a5][a4] = a3;
    }
  }
}

- (unsigned)passRuleForElement:(int64_t)a3 forSourceAtIndex:(unint64_t)a4
{
  unint64_t sourceCount;
  void *v10;
  void *v11;

  sourceCount = self->_sourceCount;
  if (sourceCount <= a4)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventFusion.m"), 197, CFSTR("Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)"), a4, self->_sourceCount);

    sourceCount = self->_sourceCount;
  }
  if (sourceCount > a4)
  {
    if (a3 < 47)
      return self->_matrix[a4][a3];
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventFusion.m"), 202, CFSTR("Invalid element (%llu)"), a3);

  }
  return 0;
}

- (void)enumerateElementsForSourceAtIndex:(unint64_t)a3 withBlock:(id)a4
{
  id v7;
  unint64_t sourceCount;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;

  v7 = a4;
  sourceCount = self->_sourceCount;
  if (sourceCount <= a3)
  {
    v13 = v7;
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventFusion.m"), 212, CFSTR("Invalid sourceIndex (%llu).  Greater than _sourceCount (%llu)"), a3, self->_sourceCount);

    v7 = v13;
    sourceCount = self->_sourceCount;
  }
  if (sourceCount > a3)
  {
    v9 = 0;
    v10 = a3;
    v12 = v7;
    do
    {
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v12, v9, self->_matrix[v10][v9]);
      v7 = v12;
      ++v9;
    }
    while (v9 != 47);
  }

}

- (unint64_t)sourceCount
{
  return self->_sourceCount;
}

@end
