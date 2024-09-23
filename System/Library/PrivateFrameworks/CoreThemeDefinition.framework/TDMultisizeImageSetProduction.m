@implementation TDMultisizeImageSetProduction

- (TDMultisizeImageSetProduction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  TDMultisizeImageSetProduction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TDMultisizeImageSetProduction;
  v4 = -[TDMultisizeImageSetProduction initWithEntity:insertIntoManagedObjectContext:](&v6, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
  -[TDMultisizeImageSetProduction setMakeOpaqueIfPossible:](v4, "setMakeOpaqueIfPossible:", 1);
  return v4;
}

- (void)processRendition:(id)a3 withBackstop:(id)a4
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TDMultisizeImageSetProduction;
  -[TDNamedArtworkProduction processRendition:withBackstop:](&v8, sel_processRendition_withBackstop_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDMultisizeImageSetProduction.m"), 39, CFSTR("why is TDMultisizeImageSetProduction.m getting passed something else"));
  objc_msgSend(a4, "setSizeIndex:", objc_msgSend(a3, "sizeIndex"));
  objc_msgSend(a4, "setMultisizeImageSetRendition:", objc_msgSend(a3, "multisizeImageSetRendition"));
}

@end
