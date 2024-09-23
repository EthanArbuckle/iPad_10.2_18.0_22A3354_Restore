@implementation DMCPayloadDetailsCell

- (void)setDetail:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DMCPayloadDetailsCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6B80], "valueCellConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDF6B80], "valueCellConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setDateStyle:", 1);
      objc_msgSend(v10, "setTimeStyle:", 2);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLocale:", v11);

      objc_msgSend(v10, "stringFromDate:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v14, "setSecondaryText:", 0);
        objc_msgSend(v8, "setText:", v6);
        v12 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v7, "DMCProfileHexString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = v9;
LABEL_10:
  objc_msgSend(v8, "setText:", v6);
  if (!v12)
  {
LABEL_13:
    v19 = v6;
    goto LABEL_14;
  }
  v15 = objc_alloc(MEMORY[0x24BDD1458]);
  v20 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileSecondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v12, v17);
  objc_msgSend(v8, "setSecondaryAttributedText:", v18);

  v19 = v12;
LABEL_14:
  -[DMCPayloadDetailsCell setCopyableText:](self, "setCopyableText:", v19);
  -[DMCPayloadDetailsCell _addCopyEditMenuAction](self, "_addCopyEditMenuAction");
  -[DMCPayloadDetailsCell setContentConfiguration:](self, "setContentConfiguration:", v8);

}

- (void)_addCopyEditMenuAction
{
  UIEditMenuInteraction *v3;
  UIEditMenuInteraction *editMenuInteraction;
  UIEditMenuInteraction *v5;
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *longPress;
  void *v8;
  char v9;

  if (!self->_editMenuInteraction)
  {
    v3 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A30]), "initWithDelegate:", self);
    editMenuInteraction = self->_editMenuInteraction;
    self->_editMenuInteraction = v3;
    v5 = v3;

    -[DMCPayloadDetailsCell addInteraction:](self, "addInteraction:", v5);
  }
  if (!self->_longPress)
  {
    v6 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__didLongPress_);
    longPress = self->_longPress;
    self->_longPress = v6;

  }
  -[DMCPayloadDetailsCell gestureRecognizers](self, "gestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", self->_longPress);

  if ((v9 & 1) == 0)
    -[DMCPayloadDetailsCell addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPress);
}

- (void)_didLongPress:(id)a3
{
  id v4;

  -[DMCPayloadDetailsCell center](self, "center", a3);
  objc_msgSend(MEMORY[0x24BDF6A28], "configurationWithIdentifier:sourcePoint:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v4);

}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  -[DMCPayloadDetailsCell copyableText](self, "copyableText", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;

  if (sel_copy_ != a3)
    return 0;
  -[DMCPayloadDetailsCell copyableText](self, "copyableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (NSString)copyableText
{
  return self->_copyableText;
}

- (void)setCopyableText:(id)a3
{
  objc_storeStrong((id *)&self->_copyableText, a3);
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editMenuInteraction, a3);
}

- (UILongPressGestureRecognizer)longPress
{
  return self->_longPress;
}

- (void)setLongPress:(id)a3
{
  objc_storeStrong((id *)&self->_longPress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_copyableText, 0);
}

@end
