@implementation UIPasteboard_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPasteboard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)generalPasteboard
{
  void *v3;
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(a1, "_accessibilityUseQuickSpeakPasteBoard"))
  {
    objc_msgSend(a1, "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___UIPasteboard_QSExtras;
    objc_msgSendSuper2(&v5, sel_generalPasteboard);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)pasteboardWithName:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(a1, "_accessibilityUseQuickSpeakPasteBoard"))
  {
    objc_msgSend(a1, "_accessibilityQuickSpeakPasteboard");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___UIPasteboard_QSExtras;
    objc_msgSendSuper2(&v10, sel_pasteboardWithName_create_, v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)pasteboardWithUniqueName
{
  void *v3;
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(a1, "_accessibilityUseQuickSpeakPasteBoard"))
  {
    objc_msgSend(a1, "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___UIPasteboard_QSExtras;
    objc_msgSendSuper2(&v5, sel_pasteboardWithUniqueName);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)changeCount
{
  void *v3;
  int64_t v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "changeCount");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    return -[UIPasteboard_QSExtras changeCount](&v6, sel_changeCount);
  }
}

- (id)pasteboardTypes
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pasteboardTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras pasteboardTypes](&v6, sel_pasteboardTypes);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)containsPasteboardTypes:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsPasteboardTypes:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPasteboard_QSExtras;
    v6 = -[UIPasteboard_QSExtras containsPasteboardTypes:](&v8, sel_containsPasteboardTypes_, v4);
  }

  return v6;
}

- (id)dataForPasteboardType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataForPasteboardType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras dataForPasteboardType:](&v8, sel_dataForPasteboardType_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)valueForPasteboardType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForPasteboardType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras valueForPasteboardType:](&v8, sel_valueForPasteboardType_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setValue:(id)a3 forPasteboardType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forPasteboardType:", v6, v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras setValue:forPasteboardType:](&v9, sel_setValue_forPasteboardType_, v6, v7);
  }

}

- (void)setData:(id)a3 forPasteboardType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:forPasteboardType:", v6, v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras setData:forPasteboardType:](&v9, sel_setData_forPasteboardType_, v6, v7);
  }

}

- (int64_t)numberOfItems
{
  void *v3;
  int64_t v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfItems");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    return -[UIPasteboard_QSExtras numberOfItems](&v6, sel_numberOfItems);
  }
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pasteboardTypesForItemSet:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras pasteboardTypesForItemSet:](&v8, sel_pasteboardTypesForItemSet_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setStrings:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrings:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras setStrings:](&v6, sel_setStrings_, v4);
  }

}

- (BOOL)containsPasteboardTypes:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsPasteboardTypes:inItemSet:", v6, v7);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIPasteboard_QSExtras;
    v9 = -[UIPasteboard_QSExtras containsPasteboardTypes:inItemSet:](&v11, sel_containsPasteboardTypes_inItemSet_, v6, v7);
  }

  return v9;
}

- (id)itemSetWithPasteboardTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemSetWithPasteboardTypes:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras itemSetWithPasteboardTypes:](&v8, sel_itemSetWithPasteboardTypes_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valuesForPasteboardType:inItemSet:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras valuesForPasteboardType:inItemSet:](&v11, sel_valuesForPasteboardType_inItemSet_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataForPasteboardType:inItemSet:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras dataForPasteboardType:inItemSet:](&v11, sel_dataForPasteboardType_inItemSet_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)items
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras items](&v6, sel_items);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setItems:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras setItems:](&v6, sel_setItems_, v4);
  }

}

- (void)addItems:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addItems:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras addItems:](&v6, sel_addItems_, v4);
  }

}

- (id)string
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras string](&v6, sel_string);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)strings
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "strings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras strings](&v6, sel_strings);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)URL
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras URL](&v6, "URL");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)URLs
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras URLs](&v6, sel_URLs);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)image
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras image](&v6, sel_image);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)images
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "images");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras images](&v6, sel_images);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)color
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras color](&v6, sel_color);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)colors
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIPasteboard_QSExtras _accessibilityShouldSwapReceiverWithQuickSpeakPasteboard](self, "_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard"))
  {
    objc_msgSend((id)objc_opt_class(), "_accessibilityQuickSpeakPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPasteboard_QSExtras;
    -[UIPasteboard_QSExtras colors](&v6, sel_colors);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (BOOL)_accessibilityUseQuickSpeakPasteBoard
{
  void *v2;
  char v3;

  objc_getAssociatedObject(a1, &QuickSpeakUsePBFlagStorageKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (void)_accessibilitySetUseQuickSpeakPasteBoard:(BOOL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &QuickSpeakUsePBFlagStorageKey, v5, (void *)1);

  if (!a3)
    objc_setAssociatedObject(a1, &QuickSpeakPasteboardStorageKey, 0, (void *)1);
}

+ (id)_accessibilityQuickSpeakPasteboard
{
  void *v3;
  objc_super v5;

  objc_getAssociatedObject(a1, &QuickSpeakPasteboardStorageKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___UIPasteboard_QSExtras;
    objc_msgSendSuper2(&v5, sel_pasteboardWithName_create_, CFSTR("QuickSpeakPasteboard"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &QuickSpeakPasteboardStorageKey, v3, (void *)1);
  }
  return v3;
}

- (BOOL)_accessibilityShouldSwapReceiverWithQuickSpeakPasteboard
{
  int v3;
  void *v4;
  UIPasteboard_QSExtras *v5;
  BOOL v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  AXPerformSafeBlock();
  v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  if (!v3)
    return 0;
  v4 = (void *)objc_opt_class();
  objc_getAssociatedObject(v4, &QuickSpeakPasteboardStorageKey);
  v5 = (UIPasteboard_QSExtras *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != self;

  return v6;
}

@end
