@implementation CADFetchCalendarItemsWithPredicateOperation

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_opt_class(), "queryDatabase:withID:predicate:connection:serializer:cancellationToken:", a3, a2, a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
