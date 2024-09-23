@implementation AIAudiogramAxis

- (AIAudiogramAxis)initWithAxis:(unint64_t)a3 values:(id)a4
{
  id v6;
  AIAudiogramAxis *v7;
  AIAudiogramAxis *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AIAudiogramAxis;
  v7 = -[AIAudiogramAxis init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AIAudiogramAxis setAxis:](v7, "setAxis:", a3);
    -[AIAudiogramAxis setValues:](v8, "setValues:", v6);
  }

  return v8;
}

- (AIRecognizedText)minValue
{
  void *v2;
  void *v3;

  -[AIAudiogramAxis values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AIRecognizedText *)v3;
}

- (AIRecognizedText)maxValue
{
  void *v2;
  void *v3;

  -[AIAudiogramAxis values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AIRecognizedText *)v3;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = -[AIAudiogramAxis axis](self, "axis");
  v4 = CFSTR("y");
  if (!v3)
    v4 = CFSTR("x");
  v5 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)AIAudiogramAxis;
  v6 = v4;
  -[AIAudiogramAxis description](&v11, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramAxis values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@ axis) %@"), v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    v23 = v4;
    v5 = -[AIAudiogramAxis axis](self, "axis");
    if (v5 != objc_msgSend((id)v19[5], "axis"))
      goto LABEL_6;
    -[AIAudiogramAxis values](self, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend((id)v19[5], "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 1;
      -[AIAudiogramAxis values](self, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __27__AIAudiogramAxis_isEqual___block_invoke;
      v13[3] = &unk_24FD6D7A8;
      v13[4] = &v18;
      v13[5] = &v14;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

      v11 = *((_BYTE *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
LABEL_6:
      v11 = 0;
    }
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __27__AIAudiogramAxis_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = a2;
  objc_msgSend(v7, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
