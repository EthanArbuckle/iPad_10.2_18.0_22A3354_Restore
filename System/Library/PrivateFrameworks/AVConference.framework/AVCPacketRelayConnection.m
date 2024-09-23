@implementation AVCPacketRelayConnection

+ (id)connectionWithSocket:(unsigned __int16)a3
{
  return -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]([AVCPacketRelaySocketConnection alloc], "initWithSocket:remoteAddress:packetFilter:", a3, 0, 0);
}

+ (id)connectionWithSocket:(unsigned __int16)a3 remoteAddress:(id)a4
{
  return -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]([AVCPacketRelaySocketConnection alloc], "initWithSocket:remoteAddress:packetFilter:", a3, a4, 0);
}

+ (id)connectionWithSocket:(unsigned __int16)a3 remoteAddress:(id)a4 packetFilter:(id)a5
{
  return -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]([AVCPacketRelaySocketConnection alloc], "initWithSocket:remoteAddress:packetFilter:", a3, a4, a5);
}

+ (id)connectionWithIDSDestination:(id)a3
{
  return -[AVCPacketRelayIDSConnection initWithIDSDestination:]([AVCPacketRelayIDSConnection alloc], "initWithIDSDestination:", a3);
}

+ (id)connectionWithIDSSocketDescriptor:(unsigned __int16)a3
{
  return -[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]([AVCPacketRelayIDSConnection alloc], "initWithIDSSocketDescriptor:", a3);
}

@end
