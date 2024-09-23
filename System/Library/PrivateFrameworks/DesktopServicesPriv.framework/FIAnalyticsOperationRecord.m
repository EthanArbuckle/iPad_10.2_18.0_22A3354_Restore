@implementation FIAnalyticsOperationRecord

- (FIAnalyticsOperationRecord)initWithEventName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIAnalyticsOperationRecord;
  return -[FIAnalyticsRecord initWithEventName:](&v4, sel_initWithEventName_, a3);
}

- (BOOL)validate
{
  _BOOL4 v3;
  objc_super v5;

  if (-[NSString isEqualToString:](self->super._eventName, "isEqualToString:", CFSTR("com.apple.finder.copymove.result"))|| (v3 = -[NSString isEqualToString:](self->super._eventName, "isEqualToString:", CFSTR("com.apple.finder.emptytrash.result"))))
  {
    v5.receiver = self;
    v5.super_class = (Class)FIAnalyticsOperationRecord;
    LOBYTE(v3) = -[FIAnalyticsRecord validate](&v5, sel_validate);
  }
  return v3;
}

- (void)setItemType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIAnalyticsOperationRecord setObject:forKey:](self, "setObject:forKey:");

}

- (void)setFileSystem:(unint64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIAnalyticsOperationRecord setObject:forKey:](self, "setObject:forKey:", v6, v7);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SubKind")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("Status")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("ItemType")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("IsSystemRestore")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("IsVolumeRestore")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("SrcFS")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("DstFS")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("SrcNameMultiByteChars")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("SrcPathMultiByteChars")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("DstPathMultiByteChars")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("IsCopyExactly")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("NumRootItems")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("SrcIsICloud")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("DstIsICloud")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("TotalVisibleItems")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("TotalFSItems")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("TotalBytes")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("CompletedVisibleItems")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("CompletedFSItems")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("CompletedBytes")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("LastStage")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("ErrorMessage")) & 1) == 0)
  {
    objc_msgSend(v6, "isEqualToString:", CFSTR("AlertMsg"));
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDict, "setObject:forKeyedSubscript:", v7, v6);

}

@end
