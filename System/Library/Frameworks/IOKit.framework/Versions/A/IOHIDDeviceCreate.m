@implementation IOHIDDeviceCreate

__n128 __IOHIDDeviceCreate_block_invoke()
{
  __int128 v0;
  __n128 result;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
  xmmword_1EDF7BD60 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&qword_1EDF7BD70 = v0;
  result = *(__n128 *)MEMORY[0x1E0C9B3B0];
  __callbackBaseSetCallbacks = *MEMORY[0x1E0C9B3B0];
  qword_1EDF7BD70 = (uint64_t)__IOHIDDeviceCallbackBaseDataIsEqual;
  return result;
}

@end
