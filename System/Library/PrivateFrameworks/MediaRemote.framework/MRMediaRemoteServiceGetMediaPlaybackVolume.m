@implementation MRMediaRemoteServiceGetMediaPlaybackVolume

uint64_t __MRMediaRemoteServiceGetMediaPlaybackVolume_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  __n128 v4;

  if (xdict == (xpc_object_t)MEMORY[0x1E0C81258] || xdict == (xpc_object_t)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v4.n128_u32[0] = 0;
  }
  else
  {
    v4.n128_f64[0] = xpc_dictionary_get_double(xdict, "MRXPC_VOLUME_VALUE_KEY");
    v4.n128_f32[0] = v4.n128_f64[0];
  }
  (*(void (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(v4);
  return kdebug_trace();
}

@end
