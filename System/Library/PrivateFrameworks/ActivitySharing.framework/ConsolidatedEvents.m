@implementation ConsolidatedEvents

void ___ConsolidatedEvents_block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  id v5;
  ASRelationshipEvent *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ASRelationshipEvent *v12;

  v5 = a2;
  v6 = [ASRelationshipEvent alloc];
  v7 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ASRelationshipEvent initWithType:anchor:timestamp:](v6, "initWithType:anchor:timestamp:", v7, a3, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObject:", v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

@end
