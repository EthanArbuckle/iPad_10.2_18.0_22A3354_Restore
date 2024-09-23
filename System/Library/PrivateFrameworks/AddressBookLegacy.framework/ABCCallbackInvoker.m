@implementation ABCCallbackInvoker

- (void)invoke
{
  if (ABAddressBookIsCallbackRegistered((uint64_t)self->ab, self->cb, self->context, (const void *)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread")))((void (*)(void *, _QWORD, void *))self->cb)(self->ab, 0, self->context);
  CFRelease(self->ab);
}

@end
