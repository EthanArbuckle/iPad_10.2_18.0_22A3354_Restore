@implementation MTRDeviceDelegateInfo

- (id)description
{
  uint64_t v2;
  void *v4;
  void *delegatePointerValue;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  delegatePointerValue = self->_delegatePointerValue;
  v6 = objc_msgSend_count(self->_interestedPathsForAttributes, a2, v2);
  v9 = objc_msgSend_count(self->_interestedPathsForEvents, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("<MTRDeviceDelegateInfo: %p delegate value %p interested attribute paths count %lu event paths count %lu>"), self, delegatePointerValue, v6, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedPathsForEvents, 0);
  objc_storeStrong((id *)&self->_interestedPathsForAttributes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
