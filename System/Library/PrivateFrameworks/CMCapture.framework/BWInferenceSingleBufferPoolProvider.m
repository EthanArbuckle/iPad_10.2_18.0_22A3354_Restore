@implementation BWInferenceSingleBufferPoolProvider

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  BWPixelBufferPool *v6;

  v6 = [BWPixelBufferPool alloc];
  return -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v6, "initWithVideoFormat:capacity:name:memoryPool:", a4, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepared BWInferenceSingleBufferPool for %@"), a3), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
}

@end
