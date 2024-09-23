@implementation MPPlaybackContext(MPCPlaybackQueue)

- (void)getRemotePlaybackQueueRepresentationWithCompletion:()MPCPlaybackQueue
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))a3)[2](v5, 0, v6);

}

@end
