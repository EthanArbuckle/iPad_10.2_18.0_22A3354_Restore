@implementation ABGroupMembershipPredicate

- (void)dealloc
{
  void *group;
  void *store;
  objc_super v5;

  group = self->_group;
  if (group)
    CFRelease(group);
  store = self->_store;
  if (store)
    CFRelease(store);

  v5.receiver = self;
  v5.super_class = (Class)ABGroupMembershipPredicate;
  -[ABPredicate dealloc](&v5, sel_dealloc);
}

- (void)setGroup:(void *)a3
{
  void *group;

  group = self->_group;
  if (group != a3)
  {
    if (group)
      CFRelease(group);
    if (a3)
      CFRetain(a3);
    self->_group = a3;
  }
}

- (void)group
{
  return self->_group;
}

- (void)setStore:(void *)a3
{
  void *store;

  store = self->_store;
  if (store != a3)
  {
    if (store)
      CFRelease(store);
    if (a3)
      CFRetain(a3);
    self->_store = a3;
  }
}

- (void)store
{
  return self->_store;
}

- (BOOL)isValid
{
  return -[ABGroupMembershipPredicate group](self, "group")
      || -[ABGroupMembershipPredicate store](self, "store")
      || -[ABGroupMembershipPredicate accountIdentifier](self, "accountIdentifier") != 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  ABRecordID RecordID;
  ABRecordID v5;
  __CFString *v6;
  __CFString *v7;

  if (-[ABGroupMembershipPredicate group](self, "group", *(_QWORD *)&a3))
    RecordID = ABRecordGetRecordID(-[ABGroupMembershipPredicate group](self, "group"));
  else
    RecordID = -1;
  if (-[ABGroupMembershipPredicate store](self, "store"))
    v5 = ABRecordGetRecordID(-[ABGroupMembershipPredicate store](self, "store"));
  else
    v5 = -1;
  v6 = (__CFString *)objc_opt_new();
  v7 = v6;
  if (RecordID == -1)
  {
    if (v5 == -1)
    {
      if (!self->_accountIdentifier)
        return v7;
      goto LABEL_14;
    }
  }
  else
  {
    CFStringAppend(v6, CFSTR(" abp.ROWID IN (select member_id FROM ABGroupMembers WHERE group_id = ? AND member_type = 0)"));
    if (v5 == -1)
      goto LABEL_12;
    CFStringAppend(v7, CFSTR(" AND"));
  }
  CFStringAppend(v7, CFSTR(" StoreID = ?"));
LABEL_12:
  if (self->_accountIdentifier)
  {
    CFStringAppend(v7, CFSTR(" AND"));
LABEL_14:
    CFStringAppend(v7, CFSTR(" StoreID IN (SELECT abs.RowID FROM ABStore abs, ABAccount aba WHERE abs.AccountID = aba.ROWID AND aba.AccountIdentifier = ?)"));
  }
  return v7;
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  ABRecordID RecordID;
  ABRecordID v9;
  NSString *accountIdentifier;
  objc_super v11;

  if (-[ABGroupMembershipPredicate group](self, "group", a3, a4, *(_QWORD *)&a5))
    RecordID = ABRecordGetRecordID(-[ABGroupMembershipPredicate group](self, "group"));
  else
    RecordID = -1;
  if (-[ABGroupMembershipPredicate store](self, "store"))
    v9 = ABRecordGetRecordID(-[ABGroupMembershipPredicate store](self, "store"));
  else
    v9 = -1;
  if (RecordID != -1)
  {
    sqlite3_bind_int(a3->var1, *a4, RecordID);
    ++*a4;
  }
  if (v9 != -1)
  {
    sqlite3_bind_int(a3->var1, *a4, v9);
    ++*a4;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v11.receiver = self;
    v11.super_class = (Class)ABGroupMembershipPredicate;
    -[ABPredicate bindString:toStatement:withBindingOffset:](&v11, sel_bindString_toStatement_withBindingOffset_, accountIdentifier, a3, a4);
  }
}

- (id)description
{
  uint64_t RecordID;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ABGroupMembershipPredicate group](self, "group"))
    RecordID = ABRecordGetRecordID(-[ABGroupMembershipPredicate group](self, "group"));
  else
    RecordID = 0xFFFFFFFFLL;
  if (-[ABGroupMembershipPredicate store](self, "store"))
    v4 = ABRecordGetRecordID(-[ABGroupMembershipPredicate store](self, "store"));
  else
    v4 = 0xFFFFFFFFLL;
  if (-[ABGroupMembershipPredicate group](self, "group"))
    v5 = (void *)ABRecordCopyValue(-[ABGroupMembershipPredicate group](self, "group"), kABGroupNameProperty);
  else
    v5 = 0;
  if (-[ABGroupMembershipPredicate store](self, "store"))
    v6 = (void *)ABRecordCopyValue(-[ABGroupMembershipPredicate store](self, "store"), kABSourceNameProperty);
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPredicate %p - person in group (%i %@), store (%i %@), account (%@)"), self, RecordID, v5, v4, v6, self->_accountIdentifier);

  return v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
