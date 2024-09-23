@implementation SUUIIndexBarEntryListController

+ (id)entryListControllerForEntryViewElement:(id)a3
{
  id v3;
  SUUIIndexBarSingleEntryListController *v4;

  v3 = a3;
  v4 = -[SUUIIndexBarSingleEntryListController initWithEntryViewElement:]([SUUIIndexBarSingleEntryListController alloc], "initWithEntryViewElement:", v3);

  return v4;
}

+ (id)entryListControllerForEntryListViewElement:(id)a3
{
  id v3;
  uint64_t v4;
  SUUIIndexBarLocaleStandardEntryListController *v5;
  SUUIIndexBarLocaleStandardEntryListController *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "entryListElementType");
  if (v4 == 2)
  {
    v5 = -[SUUIIndexBarLocaleStandardEntryListController initWithSUUIIndexBarEntryListViewElement:]([SUUIIndexBarLocaleStandardEntryListController alloc], "initWithSUUIIndexBarEntryListViewElement:", v3);
  }
  else
  {
    if (v4 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[SUUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:]([SUUIIndexBarDynamicElementEntryListController alloc], "initWithEntryListViewElement:", v3);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  return 0;
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  return 0;
}

- (void)_didInvalidate
{
  id v3;

  -[SUUIIndexBarEntryListController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "indexBarEntryListControllerDidInvalidate:", self);

}

- (SUUIIndexBarEntryListControllerDelegate)delegate
{
  return (SUUIIndexBarEntryListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)needsRootTargetViewElement
{
  return self->_needsRootTargetViewElement;
}

- (BOOL)hidesIndexBar
{
  return self->_hidesIndexBar;
}

- (NSString)rootTargetIndexBarEntryID
{
  return self->_rootTargetIndexBarEntryID;
}

- (SUUIViewElement)rootTargetViewElement
{
  return self->_rootTargetViewElement;
}

- (void)setRootTargetViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_rootTargetViewElement, a3);
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_numberOfEntryDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootTargetViewElement, 0);
  objc_storeStrong((id *)&self->_rootTargetIndexBarEntryID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
