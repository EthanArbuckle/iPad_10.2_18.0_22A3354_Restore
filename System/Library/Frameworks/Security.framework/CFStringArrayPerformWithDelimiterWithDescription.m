@implementation CFStringArrayPerformWithDelimiterWithDescription

void __CFStringArrayPerformWithDelimiterWithDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, CFSTR("%@%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFSTR(", ");
}

@end
