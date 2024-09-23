@implementation CKRecordActionMenuItem

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[CKActionMenuItem isSelected](self, "isSelected") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKRecordActionMenuItem;
    -[CKActionMenuItem setSelected:animated:](&v8, sel_setSelected_animated_, v5, v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKRecordActionMenuItem setDateSelected:](self, "setDateSelected:", v7);

    }
    else
    {
      -[CKRecordActionMenuItem setDateSelected:](self, "setDateSelected:", 0);
    }
  }
}

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a4;
  switch(a3)
  {
    case 1:
      -[CKRecordActionMenuItem setWasSelected:](self, "setWasSelected:", -[CKActionMenuItem isSelected](self, "isSelected"));
      goto LABEL_3;
    case 2:
LABEL_3:
      -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", v4, 1);
      if (v4
        && !-[CKActionMenuItem isSelected](self, "isSelected")
        && !-[CKRecordActionMenuItem wasSelected](self, "wasSelected"))
      {
        -[CKRecordActionMenuItem setSelected:animated:](self, "setSelected:animated:", 1, 1);
        -[CKActionMenuItem sendAction](self, "sendAction");
      }
      break;
    case 3:
      -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", 0, 1);
      if (v4 && -[CKActionMenuItem isSelected](self, "isSelected"))
      {
        -[CKRecordActionMenuItem dateSelected](self, "dateSelected");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (-[CKRecordActionMenuItem wasSelected](self, "wasSelected")
          || v9
          && (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
              v7 = v6,
              objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
              v7 - v8 >= 0.25))
        {
          -[CKRecordActionMenuItem setSelected:animated:](self, "setSelected:animated:", 0, 1);
          -[CKActionMenuItem sendAction](self, "sendAction");
        }

      }
      break;
    case 4:
      -[CKActionMenuItem setHighlighted:animated:](self, "setHighlighted:animated:", 0, 0);
      break;
    default:
      return;
  }
}

- (BOOL)wasSelected
{
  return self->_wasSelected;
}

- (void)setWasSelected:(BOOL)a3
{
  self->_wasSelected = a3;
}

- (NSDate)dateSelected
{
  return self->_dateSelected;
}

- (void)setDateSelected:(id)a3
{
  objc_storeStrong((id *)&self->_dateSelected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSelected, 0);
}

@end
