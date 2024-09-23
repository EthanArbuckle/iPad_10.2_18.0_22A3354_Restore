@implementation MRServiceHandleAudioAmplitudeSamplesRequest

void ___MRServiceHandleAudioAmplitudeSamplesRequest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _xpc_connection_s *v6;
  xpc_object_t reply;
  id v8;
  _xpc_connection_s *connection;

  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    connection = v6;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_data(reply, "MRXPC_AUDIO_AMPLITUDE_ARRAY_DATA_KEY", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

      }
      MRAddClientErrorToXPCMessage(reply, a3);
      xpc_connection_send_message(connection, reply);
    }

    v6 = connection;
  }

}

@end
