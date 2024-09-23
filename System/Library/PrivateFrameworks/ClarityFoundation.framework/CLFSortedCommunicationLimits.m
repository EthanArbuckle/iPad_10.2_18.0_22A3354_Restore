@implementation CLFSortedCommunicationLimits

void __CLFSortedCommunicationLimits_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("selectedContacts");
  v2[1] = CFSTR("contacts");
  v2[2] = CFSTR("everyone");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLFSortedCommunicationLimits_SortedCommunicationLimits;
  CLFSortedCommunicationLimits_SortedCommunicationLimits = v0;

}

@end
